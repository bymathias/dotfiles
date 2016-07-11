#!/bin/bash

## Install, uninstall and update .dotfiles
## https://github.com/bymathias/dotfiles

set -e

DOT_SYS=`uname -s`
DOT_BAK=$(date +"%Y-%m-%d").bak
DOT_DEP=(git curl vim)

TMP_DIR=~/tmp
DOT_DIR=~/.dotfiles
DOT_FLS=(.bashrc .bash_profile .gitconfig .vim .vimrc .tmux.conf .inputrc)

echo_notice() { echo -e "\n\033[4;37m$1\033[0m"; }

dep_check()
{
	type -p $1 &> /dev/null
	local INS_DEP=$?
	[[ $INS_DEP -eq 0 ]] && echo -e "$1 OK" || echo -e "$1 is required"
	return $INS_DEP
}

dir_temp()
{
  if [ ! -d $TMP_DIR ];then
    mkdir -p $TMP_DIR && echo "$TMP_DIR created"
  else
    echo "$TMP_DIR already exists"
  fi
}

bak_files()
{
  if [[ -h ~/$1 ]]
  then
    rm -v ~/$1
  elif [[ -f ~/$1 || -d ~/$1 ]]
  then
    mv -v ~/$1 ~/$1.$DOT_BAK
  fi
}

get_files()
{
  [[ -f $1 ]] && rm -v $1
  curl -L# -o $1 $2
}

bin_scripts()
{
  local DOT_BIN=$DOT_DIR/bin

  ## WP-CLI is set of command-line tools for managing WordPress installations
  ## ref: http://wp-cli.org/
  get_files $DOT_BIN/wp https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

  ## Command line interface for testing internet bandwidth using speedtest.net
  ## ref: https://github.com/sivel/speedtest-cli
  get_files $DOT_BIN/speedtest https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py

  ## Time Machine-style backup using rsync
  ## ref: https://github.com/laurent22/rsync-time-backup
  get_files $DOT_BIN/timebackup https://github.com/laurent22/rsync-time-backup/raw/master/rsync_tmbackup.sh

  ## youtube-dl is a cli program to download videos from YouTube and a few more sites
  get_files $DOT_BIN/youtube-dl https://yt-dl.org/latest/youtube-dl

  ## The Nu Html Checker
  ## ref: https://github.com/validator/validator
  local VNU_JAR="16.6.29"
  local VNU_JAR_BIN=$DOT_BIN/vnu.jar
  [[ -f $VNU_JAR_BIN ]] && rm -v $VNU_JAR_BIN
  curl -L# -o $TMP_DIR/vnu.jar_$VNU_JAR.zip https://github.com/validator/validator/releases/download/$VNU_JAR/vnu.jar_$VNU_JAR.zip
  unzip -d $TMP_DIR/vnu.jar_$VNU_JAR $TMP_DIR/vnu.jar_$VNU_JAR.zip
  mv -v $TMP_DIR/vnu.jar_$VNU_JAR/dist/vnu.jar $VNU_JAR_BIN

  ## Make the files executable
  for file in wp speedtest timebackup youtube-dl vnu.jar
  do
    chmod +x $DOT_BIN/$file
  done
}

bootstrap()
{
  if [ $# -ne 1 ]
  then
    bootstrap help
    return
  fi
  case "$1" in
    "help")
      echo "-----------------------------------------------"
      echo " Usage:"
      echo "          ./bootstrap.sh install"
      echo "          ./bootstrap.sh uninstall"
      echo "          ./bootstrap.sh update"
      echo " "
      echo " Doc: github.com/bymathias/dotfiles"
      echo "-----------------------------------------------"
      ;;
    "install")

      ## Create all symlinks
      for file in "${DOT_FLS[@]}"
      do
        bak_files $file
        if [[ $file == ".gitconfig" ]]
        then
          ln -sv $DOT_DIR/git/$file ~/$file
        elif [[ $file == ".vim" ]]
        then
          ln -sv $DOT_DIR/vim ~/$file
        else
          ln -sv $DOT_DIR/$file ~/$file
        fi
      done

      ## Set Vim config for root user
      if [[ $DOT_SYS == "Linux" ]]; then
        sudo ln -siv $DOT_DIR/.vimrc /root/.vimrc
        sudo ln -siv $DOT_DIR/vim /root/.vim
      fi

      ## Get Vim Vundle and install plugins
      git clone https://github.com/gmarik/vundle.git vim/bundle/vundle
      vim +BundleInstall +qall 2>/dev/null

      ## Required for Vim plugins
      ## Vim instant markdown
      # npm -g install instant-markdown-d
      # if [[ $DOT_SYS == "Linux" ]]; then
      #     sudo apt-get install xdg-utils
      # fi

      ## Get bin scripts
      bin_scripts

      ;;
    "uninstall")

      ## Remove all symlinks
      for file in "${DOT_FLS[@]}"
      do
        rm -v ~/$file
      done

      ## Remove Vim config for root user
      if [[ $DOT_SYS == "Linux" ]]; then
        sudo rm -iv --preserve-root /root/.vimrc
        sudo rm -Riv --preserve-root /root/.vim
      fi

      ## Backup .dotfiles folder
      mv -v $DOT_DIR $DOT_DIR.$DOT_BAK

      ;;
    "update")

      ## Update Vim plugins using Vundle
      vim +BundleInstall +qall 2>/dev/null

      ## Update bin scripts
      bin_scripts

      ;;
    *)
      bootstrap help
      ;;
  esac
}

echo_notice "Checking dependencies..."
for i in "${DOT_DEP[@]}"
do
  dep_check $i
done
dir_temp

echo_notice "Dotfiles $1..."
bootstrap "$@"
