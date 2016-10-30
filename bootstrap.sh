#!/bin/bash

## Install, uninstall and update .dotfiles
## https://github.com/bymathias/dotfiles

set -e

OS=$(uname -s)
BAK=$(date +"%Y-%m-%d").bak

TMP=(~/tmp)
DOT=~/.dotfiles
SYM=(.bashrc .bash_profile .gitconfig .vim .vimrc .tmux.conf .inputrc .curlrc .wgetrc)

DEPS=(curl git ruby)

_title() { echo -e "\n\033[4;37m$1\033[0m"; }
_notice() { echo -e "$1 \033[0;34m$2\033[0m"; }

_title "Checking dependencies..."

for i in "${DEPS[@]}"; do
  if command -v "$i" &> /dev/null; then
    _notice "$i" "(ok)"
  else
    _notice "$i" "(required)"
    exit 1
  fi
done

_title "Checking directories..."

for i in "${TMP[@]}"; do
  if [[ ! -d $i ]]; then
    mkdir -pv "$i" && _notice "$i" "(created)"
  else
    _notice "$i" "(exists)"
  fi
done

[[ $1 -eq 0 ]] && _title "Dotfiles $1..."

case "$1" in
  "install")

    # Remove symlinks and backup old dotfiles
    for i in "${SYM[@]}"; do
      if [[ -h "$HOME/$i" ]]; then
        rm -v "$HOME/$i"
      elif [[ -f "$HOME/$i" || -d "$HOME/$i" ]]; then
        mv -v "$HOME/$i" "$HOME/$i.$BAK"
      fi
    done
    # Creates all symlinks in `$HOME`
    for i in "${SYM[@]}"; do
      if [[ $i == ".gitconfig" ]]; then
        ln -sv "$DOT/git/$i" "$HOME/$i"
      elif [[ $i == ".vim" ]]; then
        ln -sv "$DOT/vim" "$HOME/$i"
      else
        ln -sv "$DOT/$i" "$HOME/$i"
      fi
    done

    # VIM
    # Linux: Set Vim config for root user
    if [[ $OS == "Linux" ]]; then
      sudo ln -siv "$DOT/.vimrc" "/root/.vimrc"
      sudo ln -siv "$DOT/vim" "/root/.vim"
    fi

    ;;
  "uninstall")

    # Remove all symlinks
    for i in "${SYM[@]}"; do
      if [[ -h "$HOME/$i" ]]; then
        rm -v "$HOME/$i"
      fi
    done

    # VIM
    # Linux: Remove Vim config for root user
    if [[ $OS == "Linux" ]]; then
      sudo rm -iv --preserve-root "/root/.vimrc"
      sudo rm -Riv --preserve-root "/root/.vim"
    fi

    # Backup '.dotfiles' folder
    mv -v $DOT "$DOT.$BAK"

    ;;
  "update")

  	# The Nu Html Checker
  	# ref: https://github.com/validator/validator
  	VJ="16.6.29"
  	VJ_BIN=$DOT/bin/vnu.jar
    echo "Nu Html Checker..."
  	[[ -f $VJ_BIN ]] && rm $VJ_BIN
  	curl -L# -o $TMP/vnu.jar_$VJ.zip https://github.com/validator/validator/releases/download/$VJ/vnu.jar_$VJ.zip
  	unzip -d $TMP/vnu.jar_$VJ -o $TMP/vnu.jar_$VJ.zip
  	mv $TMP/vnu.jar_$VJ/dist/vnu.jar $VJ_BIN
		chmod +x $VJ_BIN
    _notice $VJ_BIN "(ok)"
    unset VJ_BIN
    unset VJ

    # Command line interface for testing internet bandwidth using speedtest.net
    # ref: https://github.com/sivel/speedtest-cli
    ST_BIN=$DOT/bin/speedtest-cli
    echo "Speedtest cli ..."
  	[[ -f $ST_BIN ]] && rm $ST_BIN
    curl -L# -o $ST_BIN https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
		chmod +x $ST_BIN
    _notice $ST_BIN "(ok)"
    unset ST_BIN

		# Time Machine-style backup using rsync
		# ref: https://github.com/laurent22/rsync-time-backup
    RTM_BIN=$DOT/bin/rsync-time-backup
    echo "Rsync time backup..."
  	[[ -f $RTM_BIN ]] && rm $RTM_BIN
    curl -L# -o $RTM_BIN https://github.com/laurent22/rsync-time-backup/raw/master/rsync_tmbackup.sh
		chmod +x $RTM_BIN
    _notice $RTM_BIN "(ok)"
    unset RTM_BIN

    ;;
  *)
    _title "Usage..."
    _notice "./bootstrap.sh" "[ install | uninstall ]"
    ;;
esac
