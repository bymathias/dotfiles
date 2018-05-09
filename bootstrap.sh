#!/usr/bin/env bash
#
# Install, update and remove .dotfiles
# url: https://github.com/bymathias/dotfiles
#
# Use the set command to set or unset values of shell options and positional parameters.
# -e: Exit immediately if a command exits with a non-zero status
# -u: Treat unset variables as an error when substituting
# -o pipefail: Prevents errors in a pipeline from being masked
set -euo pipefail


dotfiles=".dotfiles"
gitinfos=(user.name user.email github.user)

declare -A symlinks=(
  [0]="bash .bashrc .bashrc"
  [1]="bash .bash_profile .bash_profile"
  [2]="git .gitconfig .gitconfig"
  [3]="curl .curlrc .curlrc"
  [4]="wget .wgetrc .wgetrc"
  [5]="vim vim .vim"
  [6]="vim .vimrc .vimrc"
  [7]="editorconfig .editorconfig .editorconfig"
  [8]="tmux .tmux.conf .tmux.conf"
  [9]="tmux tmux .tmux"
  [10]="terminator config/terminator/config .config/terminator/config"
)

dirtemp=$(mktemp -dq ~/tmp/dotfiles.XXXXXX)
extback="$(date +'%Y-%m-%d').backup"

# if [[ ${BASH_VERSINFO[0]} -lt 4 ]]; then
#   echo "Bash version 4 is required !" 1>&2
#   exit 1
# fi

# ============================================================= #
#   HELPER FUNCTIONS
# ============================================================= #

# Print output underlined
_log() {
  printf "[i] \e[0;4m%s\e[0m\n" "$1"
}

# Print output in yellow
_ask() {
  printf "\e[0;33m[?] %s: \e[0m" "$1"
}

# Check if command exists
_cmd_exist() {
  local status

  command -v "$1" > /dev/null 2>&1
  status=$?
  [[ "$status" == 0 ]] \
	  && printf "\e[0;32m[✔] '%s' found\e[0m\n" "$1" \
    || printf "\e[0;31m[✖] '%s' not found\e[0m\n" "$1"

  return $status
}

# Edit '.gitconfig' informations, prompt user if none found
_git_config_edit() {
  local info
  info=$(git config --global --get "$1" || echo "")

  if [[ -z "$info" ]]; then
    _ask "Edit 'git' config '$i'"
    read -r -t 30
    info=$REPLY
  fi

  command git config --file "$HOME/$dotfiles/.gitconfig" --replace-all "$1" "$info" \
    && echo "'git' config '$1' edited to '$info'"
}

# Setup vim plugins with 'vim-plug'
_vim_setup() {
  local cmd

  [[ -d "$HOME/$dotfiles/vim/plugins" ]] \
    && cmd="+PlugClean! +PlugUpgrade +PlugUpdate" \
    || cmd="+PlugInstall"

  command vim $cmd +qall \
    && echo "'vim' setup ($cmd) done"
}

# Setup Tmux plugins with 'tpm'
#_tmux_setup() {
#  if [[ -d "$HOME/$dotfiles/tmux/plugins" ]]; then
#    #statements
#  fi
#}

# Remove symlink and move files/directories
_file_remove() {
  local arr=($@)

  local file="$HOME/${arr[@]:(-1)}"

  if [[ -h "$file" ]]; then
    rm -v "$file"
  elif [[ -f "$file" ]] || [[ -d "$file" ]]; then
    mv -v "$file" "$file.$extback"
  fi
}

# Symlink files from '~/.dotfiles' to '$HOME'
_file_symlink() {
  local arr=($@)

  local cmd="${arr[0]}"
  local src="$dotfiles/${arr[1]}"
  local out="${arr[2]}"

  if _cmd_exist "$cmd"; then
    _file_remove "$out" \
      && command ln -sv "$HOME/$src" "$HOME/$out"
  else
    echo "Install '$cmd' and run this script again"
  fi
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
    "install"|"i"|"update")

      _log "Symlink '.dotfiles' to '$HOME' directory.."
      for i in "${symlinks[@]}"; do
        _file_symlink "$i"
      done

      if _cmd_exist "git"; then
        _log "Edit 'gitconfig' user infos.."
        for i in "${gitinfos[@]}"; do
          _git_config_edit "$i"
        done
      fi

      if _cmd_exist "vim"; then
        _log "Vim setup with 'vim-plug'.."
        _vim_setup
      fi

      if _cmd_exist "tmux"; then
        _log "Tmux setup with 'tpm'.."
        source ~/.dotfiles/tmux/plugins/tpm/bin/install_plugins
      fi
    ;;
    # ========================================== #
    "uninstall")

      for i in "${symlinks[@]}"; do
        _file_remove "$i"
      done

      _file_remove "$dotfiles"

    ;;
    # ========================================== #
    # "test")

    # ;;
    # ========================================== #
    "help"|*)
      echo "help.."
    ;;
esac
}

# Main executable function at end of script
_bootstrap "$@"
