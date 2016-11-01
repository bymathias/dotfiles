#!/bin/bash

# Install, uninstall and update .dotfiles
# https://github.com/bymathias/dotfiles

set -eo pipefail

SYSTEM=$(uname -s)
TODAY=$(date +"%Y-%m-%d")
TMP_DIRECTORY=~/tmp

DOT_DIRECTORY=~/.dotfiles
DOT_SYMLINKS=(.bashrc .bash_profile .gitconfig .vim .vimrc .tmux.conf .inputrc .curlrc .wgetrc)
DOT_DEPENDENCIES=(curl git ruby)

_dot_remove() {
  local FILE="$HOME/$1"
  if [[ -h "$FILE" ]]; then
    rm -v "$FILE"
  elif [[ -f "$FILE" || -d "$FILE" ]]; then
    mv -v "$FILE" "$FILE.$TODAY.bak"
  fi
}

_dot_symlink() {
  local FILE="$HOME/$1"
  if [[ $1 == ".gitconfig" ]]; then
    ln -sv "$DOT_DIRECTORY/git/$1" "$FILE"
  elif [[ $1 == ".vim" ]]; then
    ln -sv "$DOT_DIRECTORY/vim" "$FILE"
  else
    ln -sv "$DOT_DIRECTORY/$1" "$FILE"
  fi
}

_bin_get() {
  local FILE="$DOT_DIRECTORY/bin/$1"
  [[ -f $FILE ]] && rm $FILE
  if [[ $2 =~ ^http.* ]]; then
    curl -L# -o $FILE $2
  else
    mv $2 $FILE
  fi
  chmod -v +x $FILE
}

echo "===== check dependencies... ====="

for i in "${DOT_DEPENDENCIES[@]}"; do
  if command -v "$i" &> /dev/null; then
    echo "$i"
  else
    echo "$i required, aborting.."
    exit 1
  fi
done

mkdir -pv "$TMP_DIRECTORY"

echo "===== $1 dotfiles... ====="

case "$1" in
  "install")

    # Remove/backup and install the dotfiles
    for i in "${DOT_SYMLINKS[@]}"; do
      _dot_remove $i
      _dot_symlink $i
    done

    # VIM
    # debian: Set Vim config for root user
    if [[ $SYSTEM == "Linux" ]]; then
      sudo ln -siv "$DOT_DIRECTORY/.vimrc" "/root/.vimrc"
      sudo ln -siv "$DOT_DIRECTORY/vim" "/root/.vim"
    fi
    # Install vim plugin using vim-plug
    vim +PlugInstall +qall && echo "vim plugins"

    ;;
  "uninstall")

    # Remove/backup the dotfiles
    for i in "${DOT_SYMLINKS[@]}"; do
      _dot_remove $i
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

    # VIM
    # Update vim-plug and other plugins
    vim +PlugUpgrade +PlugUpdate +qall && echo "vim plugins"

    # LOCAL BIN
  	# The Nu Html Checker
  	# ref: https://github.com/validator/validator
  	VNU="16.6.29"
    TMP_VNU=$TMP_DIRECTORY/vnu.jar_$VNU
  	curl -L# -o $TMP_VNU.zip https://github.com/validator/validator/releases/download/$VNU/vnu.jar_$VNU.zip
  	unzip -d $TMP_VNU -o $TMP_VNU.zip
    _bin_get vnu.jar $TMP_VNU/dist/vnu.jar

    # Markdown is a text-to-HTML conversion tool
    # https://daringfireball.net/projects/markdown
    MKD="1.0.1"
    TMP_MKD=$TMP_DIRECTORY/markdown_$MKD
    curl -L# -o $TMP_MKD.zip http://daringfireball.net/projects/downloads/Markdown_$MKD.zip
    unzip -d $TMP_MKD -o $TMP_MKD.zip
    _bin_get Markdown.pl $TMP_MKD/Markdown_$MKD/Markdown.pl

		# Time Machine-style backup using rsync
		# ref: https://github.com/laurent22/rsync-time-backup
    _bin_get rsync-time-backup https://github.com/laurent22/rsync-time-backup/raw/master/rsync_tmbackup.sh

    # Command line interface for testing internet bandwidth using speedtest.net
    # ref: https://github.com/sivel/speedtest-cli
    _bin_get speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py

    # Command-line program to download videos from YouTube.com and other video sites
    # ref: https://github.com/rg3/youtube-dl
    _bin_get youtube-dl https://yt-dl.org/downloads/latest/youtube-dl

    ;;

  "test")

    echo "test..."

    ;;

  *|"help") echo "Usage: ./bootstrap.sh [ install | uninstall | update | help ]" ;;
esac

echo "===== done ! ====="
