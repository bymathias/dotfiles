#!/bin/bash

#
# Install, remove and update .dotfiles
# https://github.com/bymathias/dotfiles
#

set -e

DOT_SYS=`uname -s`
DOT_BAK=$(date +"%Y-%m-%d").bak
DOT_DEP=(git wget vim)

DOT_DIR=~/.dotfiles
DOT_FLS=(.bashrc .bash_profile .gitconfig .vim .vimrc .tmux.conf .inputrc)

DOT_WPCLI=$DOT_DIR/bin/wp
DOT_SPDT=$DOT_DIR/bin/speedtest


dep_check()
{
    type -p $1 &> /dev/null
    local INS_DEP=$?
    if [[ $INS_DEP -eq 0 ]]
    then
        echo -e "$1 OK"
    else
        echo -e "$1 is required"
    fi
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
    wget -O $1 $2
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
            echo "                                  That's it !"
            echo "-----------------------------------------------"

            ;;
        "install")

            # Create all symlinks
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

            # Get WP-CLI
            # see http://wp-cli.org/
            get_files $DOT_WPCLI https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
            chmod +x $DOT_WPCLI

            # Get Speedtest-cli
            # see https://github.com/sivel/speedtest-cli
            get_files $DOT_SPDT https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
            chmod +x $DOT_SPDT

            # Get Vim Vundle and install plugins
            git clone https://github.com/gmarik/vundle.git vim/bundle/vundle
            vim +BundleInstall +qall 2>/dev/null

            # Set Vim config for root user
            if [[ $DOT_SYS == "Linux" ]]; then
                sudo ln -siv $DOT_DIR/.vimrc /root/.vimrc
                sudo ln -siv $DOT_DIR/vim /root/.vim
            fi
 
            echo -e "\n.dotfiles installed !";
            bootstrap help

            ;;
        "uninstall")

            # Remove all symlinks
            for file in "${DOT_FLS[@]}"
            do
                rm -v ~/$file
            done

            # Remove Vim config for root user
            if [[ $DOT_SYS == "Linux" ]]; then
                sudo rm -iv --preserve-root /root/.vimrc
                sudo rm -Riv --preserve-root /root/.vim
            fi

            # Backup .dotfiles folder
            mv -v $DOT_DIR $DOT_DIR.$DOT_BAK

            echo -e "\n.dotfiles uninstalled (backup \"$DOT_DIR.$DOT_BAK\") !";

            ;;
        "update")

            # Update WP-CLI
            get_files $DOT_WPCLI https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
            chmod +x $DOT_WPCLI

            # Update Speedtest-cli
            get_files $DOT_SPDT https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
            chmod +x $DOT_SPDT

            # Update Vim plugins using Vundle
            vim +BundleInstall +qall 2>/dev/null

            echo -e "\n.dotfiles updated !"

            ;;
        *)

            bootstrap help

            ;;
    esac
}


echo -e "Checking dependencies.."

for i in "${DOT_DEP[@]}"
do
    dep_check $i
done

bootstrap "$@"
