#!/bin/bash
# shellcheck source=/dev/null
#
# Install, uninstall and update the .dotfiles
#   see: https://github.com/bymathias/dotfiles

set -euo pipefail


dot_directory=".dotfiles"
dot_directory_tmp=$(mktemp -dq ~/tmp/dotfiles.XXXXXX)

dot_git_repository='https://github.com/bymathias/dotfiles.git'
dot_git_config=(user.name user.email github.user)

dot_file_symlinks=(.bashrc .bash_profile .vim .vimrc .inputrc .editorconfig .czrc)

# Check if command exists
__cmd_exists() {
  command -v "$1" > /dev/null 2>&1
}

# Build `dot_file_symlinks` array if command exits
if __cmd_exists "git"; then
  dot_file_symlinks+=(.gitconfig)
fi

# [[ __cmd_exists "tmux" ]] && dot_file_symlinks+=(.tmux.conf)
# [[ __cmd_exists "curl" ]] && dot_file_symlinks+=(.curlrc)
# [[ __cmd_exists "wget" ]] && dot_file_symlinks+=(.wgetrc)
# [[ __cmd_exists "wget" ]] && dot_file_symlinks+=(.conkyrc)

echo ${dot_file_symlinks[@]}

# Remove symlinks and backup files/directories
__file_remove() {
  local file="$HOME/$1"

  if [ -h "$file" ]; then
    rm -v "$file"
  elif [ -f "$file" ] || [ -d "$file" ]; then
    mv -v "$file" "$dot_dirtmp/$1"
  fi
}

# Symlink dotfiles in $HOME
__file_symlink() {
  local file="$HOME/$1"
  local dir="$HOME/$dot_dir"

  if [ "$1" == ".gitconfig" ]; then
    ln -sv "$dir/git/$1" "$file"
  elif [ "$1" == ".vim" ]; then
    ln -sv "$dir/vim" "$file"
  else
    ln -sv "$dir/$1" "$file"
  fi
}

# ========================================================
#   Main functions
# ========================================================

__bootstrap() {
  if [ $# -ne 1 ]; then
    __bootstrap help
    return
  fi
  case "$1" in
    "install")

      echo "Install.."

      for i in "${dot_symlinks[@]}"; do
        __file_remove "$i"
        __file_symlink "$i"
      done

      ;;
    "uninstall")

      echo "Uninstall.."

      for i in "${dot_symlinks[@]}"; do
        __file_remove "$i"
      done

      __file_remove "$dot_dir"

      ;;
    "update")

      echo "Update.."

      # Vim plugins with vim-plug
      # - Remove unused directories (bang version will clean without prompt)
      # - Upgrade vim-plug itself
      # - Install or update plugins
      vim +PlugClean! +PlugUpgrade +PlugUpdate +qall

      ;;
    "help"|*)
      echo "Usage:"
      echo ""
      echo "  ./bootstrap.sh [ install | uninstall | help ]"
      echo ""
      ;;
  esac
}

# run it
time { __bootstrap "$@"; }
