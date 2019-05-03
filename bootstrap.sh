#!/usr/bin/env bash
# shellcheck source=/dev/null
#
# Install, update and remove .dotfiles
# url: https://github.com/bymathias/dotfiles
#
# Use the set command to set or unset values of shell options and positional parameters.
# -e: Exit immediately if a command exits with a non-zero status
# -u: Treat unset variables as an error when substituting
# -o pipefail: Prevents errors in a pipeline from being masked
set -euo pipefail

DOT_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mapfile -t DOT_SYMLINKS < <(find "$DOT_HOME" -maxdepth 1 -type f -name '.*' -exec basename {} \;)
DOT_SYMLINKS+=(vim tmux)

DOT_BACKUP="$(date +'%Y-%m-%d').backup"
# DOT_TEMP=$(mktemp -dq ~/tmp/dotfiles.XXXXXX)

declare -a DOT_VIM_PLUG=("https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" "$DOT_HOME/vim/autoload/plug.vim")
declare -a DOT_TMUX_PLUG=("https://github.com/tmux-plugins/tpm" "$DOT_HOME/tmux/plugins/tpm")

DOT_LOG_FILE="CHANGELOG.md"
DOT_GIT_REPO="https://github.com/bymathias/dotfiles"

# ============================================================= #
#   HELPER FUNCTIONS
# ============================================================= #

# Print output underlined
__log_info() {
  printf "[i] \\e[0;4m%s\\e[0m\\n" "$1"
}

# Check if command exists
__cmd() {
  command -v "$1" > /dev/null 2>&1
  return $?
}

# Remove symlink and move/backup files/directories
__move() {
  local path="$1"

  if [[ -h "$path" ]]; then
    rm "$path"
  elif [[ -f "$path" ]] || [[ -d "$path" ]]; then
    mv "$path" "$path.$DOT_BACKUP"
  fi
}

# Symlink files from '~/.dotfiles' to '$HOME'
__symlink() {
  local dist="$HOME/$2"

  __move "$dist" && \
    ln -sv "$HOME/.dotfiles/$1" "$dist"
}

# Download file using curl or wget
__download() {
  local arr=("$@")

  local url="${arr[0]}"
  local dist="${arr[1]}"

  if __cmd "curl"; then
    curl -Lo "$dist" "$url" --create-dirs &> /dev/null
    return $?
  elif __cmd "wget"; then
    mkdir -p "$(dirname "$dist")"
    wget -O "$dist" "$url" &> /dev/null
    return $?
  fi

  return 1
}

# Generate changelog from git metadata
__changelog() {
  local TODAY=$(date +"%Y-%m-%d")
  local GIT_CUR_TAG=`git describe --abbrev=0 --tags`
  local GIT_LOG_FORMAT="- %s [#]($DOT_GIT_REPO/commit/%H \"commit %h\")"

  [[ ! -f $1 ]] && touch $1
  mv $1 $TODAY-$1

  echo -e "## $2 - ($TODAY)\n" > $1
  git log \
    --no-merges \
    --date=short \
    --pretty=format:"$GIT_LOG_FORMAT" $GIT_CUR_TAG..HEAD >> $1
  echo -e "\n" >> $1
  cat $TODAY-$1 >> $1
  rm $TODAY-$1
}

# ============================================================= #
#   MAIN FUNCTION
# ============================================================= #

_bootstrap() {
  if [ $# -ne 1 ]; then
    _bootstrap help
    return
  fi

  case "$1" in
    # ========================================== #
    "install"|"update")

      __log_info "Symlink .dotfiles"
      for file in "${DOT_SYMLINKS[@]}"; do
        [[ "$file" != .* ]] && dist=".$file" || dist="$file"
        __symlink "$file" "$dist"
        unset file dist
      done

      if __cmd "vim"; # is found, it should be!
      then
        vim_str="Vim plugins"
        __log_info "$vim_str"
        if [[ -f "${DOT_VIM_PLUG[1]}" ]]; # 'vim-plug' plugin manager is installed
        then
          # Clean up and update all plugins
          vim +PlugClean! +PlugUpgrade +PlugUpdate +qall
          vim_str="$vim_str updated"
        else
          # Get 'vim-plug' plugin manager files and install plugins
          __download "${DOT_VIM_PLUG[@]}"
          vim +PlugInstall +qall
          vim_str="$vim_str installed"
        fi
        # echo "$(ls -d $DOT_HOME/vim/plugged/* | xargs -n1 basename)"
        echo "$vim_str"
      fi

      if __cmd "tmux"; # is found
      then
        tmux_str="Tmux plugins"
        __log_info "$tmux_str"
        if [[ -d "${DOT_TMUX_PLUG[1]}" ]]; # 'tpm' plugin manager is installed
        then
          # Check if 'tpm' is the only plugin installed and install/update plugins
          if [[ -z $(find "$DOT_HOME/tmux/plugins" -maxdepth 1 -type d -name 'tmux*') ]];
          then
            source "${DOT_TMUX_PLUG[1]}/bin/install_plugins" >/dev/null
            tmux_str="$tmux_str installed"
          else
            source "${DOT_TMUX_PLUG[1]}/bin/update_plugins" all >/dev/null
            tmux_str="$tmux_str updated"
          fi
        else
          # Get 'tpm' plugin manager files and install plugins
          git clone "${DOT_TMUX_PLUG[0]}" "${DOT_TMUX_PLUG[1]}" >/dev/null
          source "${DOT_TMUX_PLUG[1]}/bin/install_plugins" >/dev/null
          tmux_str="$tmux_str installed"
        fi
        echo "$tmux_str"
      fi

    ;;
    # ========================================== #
    "uninstall")

      __log_info "Remove .dotfiles"

      for file in "${DOT_SYMLINKS[@]}";
      do
        [[ "$file" != .* ]] && dist=".$file" || dist="$file"
        __move "$dist"
        unset file dist
      done
      __move "$DOT_HOME"

      echo "Done!"

    ;;
    # ========================================== #
    "release")
      GIT_CUR_TAG=`git describe --abbrev=0 --tags`

      echo -e "Bump project version (current $GIT_CUR_TAG)..."
      read -p "Bump: " V_NEW
      __changelog $DOT_LOG_FILE $V_NEW

      git add $DOT_LOG_FILE
      git tag -a v$V_NEW -m "Release version v$V_NEW"

      echo "Done!"
    ;;
    # ========================================== #
    # "test") ;;
    # ========================================== #
    "help"|*)
      echo "./bootstrap.sh [ install | uninstall ]"
    ;;
esac
}

# Main executable function at end of script
_bootstrap "$@"
