#!/bin/bash

## Install, uninstall and update .dotfiles
## https://github.com/bymathias/dotfiles

set -e

DOT_SYS=`uname -s`
DOT_BAK=$(date +"%Y-%m-%d").bak
DOT_DEP=(git curl vim)

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
    curl -fL -o $1 -s $2
}


bin_scripts()
{
    get_files $DOT_DIR/bin/wp https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    get_files $DOT_DIR/bin/speedtest https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
    get_files $DOT_DIR/bin/timebackup https://github.com/laurent22/rsync-time-backup/raw/master/rsync_tmbackup.sh
    get_files $DOT_DIR/bin/cloudapp https://raw.github.com/bonifaido/cloudapp-cli/master/cloudapp
    get_files $DOT_DIR/bin/laravel http://laravel.com/laravel.phar

    for file in wp speedtest timebackup cloudapp laravel
    do
        chmod +x $DOT_DIR/bin/$file
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

            ## Get bin scripts
            bin_scripts

            ## Get Vim Vundle and install plugins
            git clone https://github.com/gmarik/vundle.git vim/bundle/vundle
            vim +BundleInstall +qall 2>/dev/null

            ## Set Vim config for root user
            if [[ $DOT_SYS == "Linux" ]]; then
                sudo ln -siv $DOT_DIR/.vimrc /root/.vimrc
                sudo ln -siv $DOT_DIR/vim /root/.vim
            fi

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

            ## Update bin scripts
            bin_scripts

            ## Update Vim plugins using Vundle
            vim +BundleInstall +qall 2>/dev/null

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


echo_notice "Dotfiles $1..."

bootstrap "$@"


echo_notice "Dotfiles $1 done."
