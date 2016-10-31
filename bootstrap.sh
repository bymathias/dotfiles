#!/bin/bash

# Install, uninstall and update .dotfiles
# https://github.com/bymathias/dotfiles

set -e

SYSTEM=$(uname -s)
TODAY=$(date +"%Y-%m-%d")

TMP_DIRECTORY=~/tmp
DOT_DIRECTORY=~/.dotfiles
DOT_SYMLINKS=(.bashrc .bash_profile .gitconfig .vim .vimrc .tmux.conf .inputrc .curlrc .wgetrc)
DOT_DEPENDENCIES=(curl git ruby)

_file_remove() {
  local FILE="$HOME/$1"
  if [[ -h "$FILE" ]]; then
    rm -v "$FILE"
  elif [[ -f "$FILE" || -d "$FILE" ]]; then
    mv -v "$FILE" "$FILE.$TODAY.bak"
  fi
}

_file_symlink() {
  local FILE="$HOME/$1"
  if [[ $1 == ".gitconfig" ]]; then
    ln -sv "$DOT_DIRECTORY/git/$1" "$FILE"
  elif [[ $1 == ".vim" ]]; then
    ln -sv "$DOT_DIRECTORY/vim" "$FILE"
  else
    ln -sv "$DOT_DIRECTORY/$1" "$FILE"
  fi
}

_script_make() {
  [[ -f $1 ]] && rm $1
  if [[ $2 =~ ^http.* ]]; then
    curl -L# -o $1 $2
  else
    mv $2 $1
  fi
  chmod -v +x $1
}

echo "===== check dependencies..."

for i in "${DOT_DEPENDENCIES[@]}"; do
  if command -v "$i" &> /dev/null; then
    echo "$i"
  else
    echo "$i required, aborting.."
    exit 1
  fi
done

mkdir -pv "$TMP_DIRECTORY"

echo "===== $1 dotfiles..."

case "$1" in
  "install")

    # Remove/backup and install the dotfiles
    for i in "${DOT_SYMLINKS[@]}"; do
      _file_remove $i
      _file_symlink $i
    done

    # VIM
    # debian: Set Vim config for root user
    if [[ $SYSTEM == "Linux" ]]; then
      sudo ln -siv "$DOT_DIRECTORY/.vimrc" "/root/.vimrc"
      sudo ln -siv "$DOT_DIRECTORY/vim" "/root/.vim"
    fi

    ;;
  "uninstall")

    # Remove/backup the dotfiles
    for i in "${DOT_SYMLINKS[@]}"; do
      _file_remove $i
    done

    # VIM
    # debian: Remove Vim config for root user
    if [[ $SYSTEM == "Linux" ]]; then
      sudo rm -iv --preserve-root "/root/.vimrc"
      sudo rm -Riv --preserve-root "/root/.vim"
    fi

    # Backup .dotfiles directory
    mv -v $DOT_DIRECTORY "$DOT_DIRECTORY.$TODAY.bak"

    ;;
  "update")

    # LOCAL BIN
  	# The Nu Html Checker
  	# ref: https://github.com/validator/validator
  	VJV="16.6.29"
  	curl -L# -o $TMP_DIRECTORY/vnu.jar_$VJV.zip \
      https://github.com/validator/validator/releases/download/$VJV/vnu.jar_$VJV.zip
  	unzip -d $TMP_DIRECTORY/vnu.jar_$VJV -o $TMP_DIRECTORY/vnu.jar_$VJV.zip
    _script_make $DOT_DIRECTORY/bin/vnu.jar $TMP_DIRECTORY/vnu.jar_$VJV/dist/vnu.jar
    unset VJV

    # Command line interface for testing internet bandwidth using speedtest.net
    # ref: https://github.com/sivel/speedtest-cli
    _script_make $DOT_DIRECTORY/bin/speedtest-cli \
      https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py

		# Time Machine-style backup using rsync
		# ref: https://github.com/laurent22/rsync-time-backup
    _script_make $DOT_DIRECTORY/bin/rsync-time-backup \
      https://github.com/laurent22/rsync-time-backup/raw/master/rsync_tmbackup.sh

    ;;
  *|"help") echo "Usage: ./bootstrap.sh [ install | uninstall | update | help ]" ;;
esac

echo "===== done !"
