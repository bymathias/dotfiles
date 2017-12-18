#!/bin/bash
# shellcheck source=/dev/null
#
# Install, uninstall and update the .dotfiles
#   see: https://github.com/bymathias/dotfiles

# set -euo pipefail


directory_dot=".dotfiles"
directory_tmp=$(mktemp -dq ~/tmp/dotfiles.XXXXXX)
file_symlinks=(.bashrc .bash_profile .vim .vimrc .editorconfig .gitconfig .curlrc .wgetrc .tmux.conf)

# ================================================
#   Helper functions
# ================================================

# Remove symlinks and backup files/directories
_file_remove() {
  local file="$HOME/$1"

  if [ -h "$file" ]; then
    rm -v "$file"
  elif [ -f "$file" ] || [ -d "$file" ]; then
    mv -v "$file" "$directory_tmp/$1"
  fi
}

# Symlink dotfiles in $HOME
_file_symlink() {
  local file="$HOME/$1"
  local dir="$HOME/$directory_dot"

  if [ "$1" == ".gitconfig" ]; then
    ln -sv "$dir/git/$1" "$file"
  elif [ "$1" == ".vim" ]; then
    ln -sv "$dir/vim" "$file"
  else
    ln -sv "$dir/$1" "$file"
  fi
}

# ================================================
#   Main function
# ================================================

_bootstrap() {
  if [ $# -ne 1 ]; then
    _bootstrap help
    return
  fi
  case "$1" in
    "install")

      echo "Install.."

      for i in "${file_symlinks[@]}"; do
        _file_remove "$i"
        _file_symlink "$i"
      done

      # sudo ln -siv "$HOME/$directory_dot/.vimrc" "/root/.vimrc"
      # sudo ln -siv "$HOME/$directory_dot/vim" "/root/.vim"

      _bootstrap "update"

      ;;
    "uninstall")

      echo "Uninstall.."

      for i in "${file_symlinks[@]}"; do
        _file_remove "$i"
      done

      # sudo rm -iv --preserve-root "/root/.vimrc"
      # sudo rm -Riv --preserve-root "/root/.vim"

      _file_remove "$directory_dot"

      ;;
    "update")

      echo "Update.."

      # Vim plugins with vim-plug
      # - Remove unused directories (bang version will clean without prompt)
      # - Upgrade vim-plug itself
      # - Install or update plugins
      vim +PlugClean! +PlugUpgrade +PlugUpdate +qall

      ;;
    "test")

      echo "Test.."

      ;;
    "help"|*)
      echo "Usage:"
      echo ""
      echo "  ./bootstrap.sh [ install | uninstall | update | help ]"
      echo ""
      ;;
  esac
}

# run it
time { _bootstrap "$@"; }
