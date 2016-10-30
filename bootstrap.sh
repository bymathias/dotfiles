#!/bin/bash

## Install, uninstall and update .dotfiles
## https://github.com/bymathias/dotfiles

set -e

DEPENDENCIES=(git curl vim)
DIRECTORIES=(~/tmp)

DOT_DIRECTORY=~/.dotfiles
DOT_SYMLINK=(.bashrc .bash_profile .gitconfig .vim .vimrc .tmux.conf .inputrc)

SYS_NAME=$(uname -s)
EXT_BACKUP=$(date +"%Y-%m-%d").bak

_title() { echo -e "\n\033[4;37m$1\033[0m"; }
_notice() { echo -e "$1 \033[0;34m$2\033[0m"; }


_title "Checking dependencies..."

for i in "${DEPENDENCIES[@]}"; do
  if command -v "$i" &> /dev/null; then
    _notice "$i" "(ok)"
  else
    _notice "$i" "(required)"
    exit 1
  fi
done

_title "Checking directories..."

for i in "${DIRECTORIES[@]}"; do
  if [[ ! -d $i ]]; then
    mkdir -pv "$i" && _notice "$i" "(created)"
  else
    _notice "$i" "(exists)"
  fi
done

[[ $1 -eq 1 ]] && _title "Dotfiles $1..."

case "$1" in
  "install")

    # Remove symlinks and backup old dotfiles
    for i in "${DOT_SYMLINK[@]}"; do
      if [[ -h "$HOME/$i" ]]; then
        rm -v "$HOME/$i"
      elif [[ -f "$HOME/$i" || -d "$HOME/$i" ]]; then
        mv -v "$HOME/$i" "$HOME/$i.$EXT_BACKUP"
      fi
    done
    # Creates all symlinks in `$HOME`
    for i in "${DOT_SYMLINK[@]}"; do
      if [[ $i == ".gitconfig" ]]; then
        ln -sv "$DOT_DIRECTORY/git/$i" "$HOME/$i"
      elif [[ $i == ".vim" ]]; then
        ln -sv "$DOT_DIRECTORY/vim" "$HOME/$i"
      else
        ln -sv "$DOT_DIRECTORY/$i" "$HOME/$i"
      fi
    done

    # VIM
    # Linux: Set Vim config for root user
    if [[ $SYS_NAME == "Linux" ]]; then
      sudo ln -siv "$DOT_DIRECTORY/.vimrc" "/root/.vimrc"
      sudo ln -siv "$DOT_DIRECTORY/vim" "/root/.vim"
    fi

    ;;
  "uninstall")

    # Remove all symlinks
    for i in "${DOT_SYMLINK[@]}"; do
      rm -v "$HOME/$i"
    done

    # VIM
    # Linux: Remove Vim config for root user
    if [[ $DOT_SYS == "Linux" ]]; then
      sudo rm -iv --preserve-root "/root/.vimrc"
      sudo rm -Riv --preserve-root "/root/.vim"
    fi

    # Backup '.dotfiles' folder
    mv -v $DOT_DIRECTORY "$DOT_DIRECTORY.$EXT_BACKUP"

    ;;
  *)
    _title "Usage..."
    _notice "./bootstrap.sh" "[ install | uninstall ]"
    ;;
esac
