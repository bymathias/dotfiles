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

echo_notice() { echo -e "\n\033[4;37m$1\033[0m"; }

file_backup() {
	if [[ -h $1 ]];
	then
		rm -v "$1"
	elif [[ -f $1 || -d $1 ]];
	then
		mv -v "$1" "$1.$EXT_BACKUP"
	fi
}

echo_notice "Checking dependencies..."

for i in "${DEPENDENCIES[@]}"
do
	if command -v "$i" &> /dev/null;
	then
		echo "$i - ok"
	else
		echo "$i - required, aborting.."
		exit 1
	fi
done

echo_notice "Checking directories..."

for i in "${DIRECTORIES[@]}"
do
	if [[ ! -d $i ]];
	then
		mkdir -p "$i" && echo "$i created"
	else
		echo "$i already exists"
	fi
done

echo_notice "Dotfiles $1..."

case "$1" in
	"install")

		# Backup old files if any and creates all symlinks
		for i in "${DOT_SYMLINK[@]}"
		do
			file_backup "$HOME/$i"
			if [[ $i == ".gitconfig" ]]
			then
  			ln -sv "$DOT_DIRECTORY/git/$i" "$HOME/$i"
			elif [[ $i == ".vim" ]]
			then
  			ln -sv "$DOT_DIRECTORY/vim" "$HOME/$i"
			else
  			ln -sv "$DOT_DIRECTORY/$i" "$HOME/$i"
			fi
		done

		# VIM
		# Linux: Set Vim config for root user
		if [[ $SYS_NAME == "Linux" ]];
		then
			sudo ln -siv "$DOT_DIRECTORY/.vimrc" "/root/.vimrc"
			sudo ln -siv "$DOT_DIRECTORY/vim" "/root/.vim"
		fi
		# Get Vundle, Vim plugin manager and install plugins
		git clone https://github.com/gmarik/vundle.git vim/bundle/vundle
		vim +PluginInstall +qall 2>/dev/null

		;;
	"uninstall")

		# Remove all symlinks
		for i in "${DOT_SYMLINK[@]}"
		do
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

		echo "	Usage:"
		echo ""
		echo "		./bootstrap.sh install"
		echo "		./bootstrap.sh uninstall"
		echo ""
		echo "	Doc: github.com/bymathias/dotfiles"

		;;
esac
