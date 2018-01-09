#!/usr/bin/env bash

#
# Install, update and remove .dotfiles
# url: https://github.com/bymathias/dotfiles
#

# -e: Exit immediately if a command exits with a non-zero status.
# -u: Treat unset variables as an error when substituting.
set -eu


# GLOBAL CONSTANTS
# ------------------------------------------------------- #

local_directory="$HOME/.dotfiles"
home_symlinks=(bashrc bash_profile vim vimrc editorconfig gitconfig curlrc wgetrc tmux.conf)

git_repo_owner='bymathias'
git_edit_infos=(user.name user.email github.user)
git_repo_url="https://github.com/$git_repo_owner/dotfiles"

# tmp_directory=$(mktemp -dq ~/tmp/dotfiles.XXXXXX)
ext_backup="$(date +'%Y-%m-%d').backup"

# HELPER FUNCTIONS
# ------------------------------------------------------- #

# Print usage
_log_usage() {
  cat <<EOF

  Usage:

  $1 [ install | i | update | u ]
  $1 [ remove | r ]
  $1 [ help | h ]

  Report bugs to '$git_repo_url'
EOF
}

# Prompt user
_ask_user() {
  printf "\e[0;33m[?] %s: \e[0m" "$1"
  read -r -n 1 -t 25
  printf "\n%s\n" "$REPLY"
}

# Check if the command exists
_cmd_exists() {
  declare cmd=$1
  local status

  command -v "$cmd" > /dev/null 2>&1
  status=$?
  if [[ "$status" == 0 ]]; then
    printf "'%s' installed\n" "$cmd"
  else
    printf "'%s' not installed\n" "$cmd"
  fi
  return $status
}

# Check git repository owner
_dotfiles_owner() {
  _cmd_exists "git" \
    && command grep -R "$1" "$local_directory/.git/config" > /dev/null 2>&1
}

# Remove symlinks and move files/directories
_file_remove() {
  if [ -h "$1" ]; then
    rm -v "$1"
  elif [ -f "$1" ] || [ -d "$1" ]; then
    mv -v "$1" "$1.$ext_backup"
  fi
}

# Remove symlink if any and create a new symlink
_file_symlink() {
  _file_remove "$2" && ln -sv "$1" "$2"
}

# Use git, curl or wget to download Github repository
_download_repository() {
  declare url=$1 dir=$2
  local cmd

  if [[ -d "$dir" ]]; then
    echo "'$dir' already exists !"
    _ask_user "Would you like to remove it (backup -> '$dir.$ext_backup') ? (y/n)"
    REPLY=${REPLY:-y}

    [[ "$REPLY" =~ ^[Yy]$ ]] && _file_remove "$dir" || return 1
  fi

  if _cmd_exists "git"; then
    command git clone --depth 1 "$url.git" "$dir"
    return 0
  elif _cmd_exists "curl"; then
    cmd="curl -#L"
  elif _cmd_exists "wget"; then
    cmd="wget --no-check-certificate -O -"
  fi

  if [ -n "$cmd" ]; then
    command mkdir -pv "$dir"
    command $cmd "$url/tarball/master" \
      | tar -xzv -C $dir --strip-components=1 > /dev/null 2>&1
  else
    echo "No git, curl or wget available. Aborting.."
    return 1
  fi
}

# Edit `.gitconfig` user info and ask if none found
_edit_gitconfig() {
  local info
  info=$(git config --global --get "$1" || echo "")

  if [ -z "$info" ]; then
    _ask_user "Enter your git '$1': "
    info=$REPLY
  fi

  git config --file "$local_directory/gitconfig" --replace-all "$1" "$info" \
    && echo "Git '$1' edited to '$info'"
}

# MAIN FUNCTION
# ------------------------------------------------------- #

_bootstrap() {
  if [ $# -ne 1 ]; then
    _bootstrap help
    return
  fi

  case "$1" in
    # ------------------------------------- #
    "install"|"update")
    if _dotfiles_owner "$git_repo_owner"; then
      # Fetch last changes from '$git_repo_url'
      (cd $local_directory && command git pull origin master || exit 1)
    else
      # Download '$git_repo_url' using git, curl or wget
      _download_repository "$git_repo_url" "$local_directory"
    fi

    # Edit '.gitconfig' user infos
    for i in ${git_edit_infos[@]}; do
      _edit_gitconfig "$i"
    done

    # Symlink '.dotfiles' in home
    for i in "${home_symlinks[@]}"; do
      _file_symlink "$local_directory/$i" "$HOME/.$i"
    done

    # If Vim is installed, install or update plugins
    # Using vim-plug to manage vim plugins
    if _cmd_exists "vim"; then
      if [[ -d "$local_directory/vim/plugins" ]]; then
        vim +PlugClean! +PlugUpgrade +PlugUpdate +qall
      else
        vim +PlugInstall +qall
      fi
      echo "Vim setup done"
    fi

    # DESKTOP: Symlink app's configuration
    if _cmd_exists "terminator"; then
      _file_symlink "$local_directory/config/terminator/terminator.config" \
        "$HOME/.config/terminator/config"
    fi
    if _cmd_exists "conky"; then
      _file_symlink "$local_directory/config/conky/conkyrc" \
        "$HOME/.conkyrc"
    fi
    ;;

    # ------------------------------------- #
    "uninstall")
    # Remove '.dotfiles' symlink in home
    for i in "${home_symlinks[@]}"; do
      _file_remove "$HOME/.$i"
    done

    # Move '.dotfiles' directory
    _file_remove "$local_directory"

    # DESKTOP: Remove symlink app's configuration
    if _cmd_exists "terminator"; then
      _file_remove "$HOME/.config/terminator/config"
    fi
    if _cmd_exists "conky"; then
      _file_remove "$HOME/.conkyrc"
    fi
    ;;

    # ------------------------------------- #
    "help"|*)
      _log_usage "$0"
    ;;
esac
}

# Main executable function at end of script
_bootstrap "$@"
