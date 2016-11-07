#!/bin/bash
# shellcheck source=/dev/null

# Install, uninstall and update .dotfiles
# https://github.com/bymathias/dotfiles

OS=$(uname -s)
NOW=$(date +"%Y-%m-%d")

TMP_DIRECTORY=~/tmp
DOT_DEPENDENCIES=(curl git vim)
DOT_DIRECTORY=~/.dotfiles
DOT_SYMLINKS=(.bashrc .bash_profile .gitconfig .vim .vimrc .tmux.conf .inputrc .curlrc .wgetrc .editorconfig)
GIT_INFOS=(user.name user.email github.user)

__dot_remove()
{
  local FILE="$HOME/$1"
  if [ -h "$FILE" ]; then
    rm -v "$FILE"
  elif [ -f "$FILE" ] || [ -d "$FILE" ]; then
    mv -v "$FILE" "$FILE.$NOW.bak"
  fi
}

__dot_symlink()
{
  local FILE="$HOME/$1"
  if [ "$1" == ".gitconfig" ]; then
    ln -sv "$DOT_DIRECTORY/git/$1" "$FILE"
  elif [ "$1" == ".vim" ]; then
    ln -sv "$DOT_DIRECTORY/vim" "$FILE"
  else
    ln -sv "$DOT_DIRECTORY/$1" "$FILE"
  fi
}

__git_config()
{
  local INFO
  INFO=$(git config --global --get "$1")
  if [ -z "$INFO" ]; then
    echo "Enter your git '$1':"
    read -r ANS
    INFO=$ANS
  else
    echo "Git '$1' edited to '$INFO'"
  fi
  git config --file "$DOT_DIRECTORY/git/.gitconfig" --replace-all "$1" "$INFO"
}

__get_script()
{
  local FILE="$DOT_DIRECTORY/$1"
  local TEMP="$TMP_DIRECTORY/$TODAY/$1"
  [ -f "$FILE" ] && rm "$FILE"
  if [ -z "$3" ]; then
    curl -L# --create-dirs -o "$FILE" "$2"
  else
    curl -L# --create-dirs -o "$TEMP.zip" "$2"
    unzip -d "$TEMP" -qo "$TEMP.zip"
    mv "$TEMP/$3" "$FILE"
  fi
  chmod +x "$FILE" && echo "$1"
}

__bootstrap()
{
  if [ $# -ne 1 ]; then
    __bootstrap help
    return
  fi
  case "$1" in
    "install")

      echo "edit git user details..."
      for i in "${GIT_INFOS[@]}"; do
        __git_config "$i"
      done

      echo "backup/remove config and install the dotfiles..."
      for i in "${DOT_SYMLINKS[@]}"; do
        __dot_remove "$i"
        __dot_symlink "$i"
      done

      if [ "$OS" == "Linux" ]; then
        echo "set Vim config for root user..."
        sudo ln -siv "$DOT_DIRECTORY/.vimrc" "/root/.vimrc"
        sudo ln -siv "$DOT_DIRECTORY/vim" "/root/.vim"
      fi

			# Run update task
			__bootstrap "update"

      ;;
    "uninstall")

      echo "backup/remove the dotfiles..."
      for i in "${DOT_SYMLINKS[@]}"; do
        __dot_remove "$i"
      done

      if [ "$OS" == "Linux" ]; then
        echo "remove Vim config for root user..."
        sudo rm -iv --preserve-root "/root/.vimrc"
        sudo rm -Riv --preserve-root "/root/.vim"
      fi

      echo "backup .dotfiles directory..."
      mv -v "$DOT_DIRECTORY" "$DOT_DIRECTORY.$NOW.bak"

      ;;
    "update")

      echo "install/update Vim plugins..."
      vim +PlugClean! +PlugUpgrade +PlugUpdate +qall

      echo "update local bin scripts..."
      VNU_JAR_VERSION="16.6.29"
      __get_script "bin/vnu.jar" \
        "https://github.com/validator/validator/releases/download/$VNU_JAR_VERSION/vnu.jar_$VNU_JAR_VERSION.zip" \
        "dist/vnu.jar"
      MARKDOWN_VERSION="1.0.1"
      __get_script "bin/Markdown.pl" \
        "http://daringfireball.net/projects/downloads/Markdown_$MARKDOWN_VERSION.zip" \
        "Markdown_$MARKDOWN_VERSION/Markdown.pl"
      __get_script "bin/rsync-tmbackup" \
        "https://github.com/laurent22/rsync-time-backup/raw/master/rsync_tmbackup.sh"
      __get_script "bin/speedtest" \
        "https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py"
      __get_script "bin/cloudapp" \
        "https://raw.github.com/bonifaido/cloudapp-cli/master/cloudapp"
      __get_script "bin/wp" \
        "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

      echo "update .iterm2_shell_integration..."
      SHELL_NAME=$(basename "$SHELL")
      __get_script "term/iTerm/.iterm2_shell_integration.$SHELL_NAME" "https://iterm2.com/misc/${SHELL_NAME}_startup.in"

      ;;

    "help"|*)
      echo "Usage: ./bootstrap.sh [ install | uninstall | update | help ]"
      ;;
  esac
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

echo "===== $1 dotfiles... ====="

__bootstrap "$@"

echo "===== done ====="
