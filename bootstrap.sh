#!/bin/bash
# shellcheck source=/dev/null
#
# ./bootstrap.sh
#
# Install, uninstall and update the .dotfiles
# see: https://github.com/bymathias/dotfiles

# set -eo pipefail

dependencies=(curl git vim)
dotfiles="$HOME/.dotfiles"
symlinks=(.bashrc .bash_profile .gitconfig .vim .vimrc .tmux.conf .inputrc .curlrc .wgetrc .editorconfig)
gitinfos=(user.name user.email github.user)
tmpdir=$(mktemp -dq ~/tmp/dotfiles.XXXXXX)

# Prompt for git user infos if none found
__git_config() {
  local info
  info=$(git config --global --get "$1" || echo "")
  if [ -z "$info" ]; then
    echo "Enter your git '$1':"
    read -r ans
    info=$ans
  else
    echo "Git '$1' edited to '$info'"
  fi
  git config --file "$dotfiles/git/.gitconfig" --replace-all "$1" "$info"
}

# Remove symlinks and backup files/directories
__dot_remove() {
  local file="$HOME/$1"
  if [ -h "$file" ]; then
    rm -v "$file"
  elif [ -f "$file" ] || [ -d "$file" ]; then
    mv -v "$file" "$file.$(date + '%Y-%m-%d').bak"
  fi
}

# Symlink dotfiles in $HOME
__dot_symlink() {
  local file="$HOME/$1"
  if [ "$1" == ".gitconfig" ]; then
    ln -sv "$dotfiles/git/$1" "$file"
  elif [ "$1" == ".vim" ]; then
    ln -sv "$dotfiles/vim" "$file"
  else
    ln -sv "$dotfiles/$1" "$file"
  fi
}

# Download external scripts
__get_script() {
  local file="$dotfiles/$1"
  local temp="$tmpdir/$1"
  [ -f "$file" ] && rm "$file"
  if [ -z "$3" ]; then
    curl -L# --create-dirs -o "$file" "$2"
  else
    curl -L# --create-dirs -o "$temp.zip" "$2"
    unzip -d "$temp" -qo "$temp.zip"
    mv "$temp/$3" "$file"
  fi
  chmod +x "$file" && echo "$1"
}

# Check requirements
__requirement() {
  echo "===== check requirements =====";
  for i in "$@"; do
 	  if command -v "$i" > /dev/null 2>&1; then
      echo "$i"
    else
      echo "$i required, aborting.."
      exit 1
    fi
  done
}

# Main function
__bootstrap() {
  if [ $# -ne 1 ]; then
    __bootstrap help
    return
  fi
  echo "===== $1 dotfiles =====";
  case "$1" in
    "install")

      echo "edit git user details..."
      for i in "${gitinfos[@]}"; do
        __git_config "$i"
      done

      echo "backup/remove config and install the dotfiles..."
      for i in "${symlinks[@]}"; do
        __dot_remove "$i"
        __dot_symlink "$i"
      done

      if [[ "$OSTYPE" == "Linux"* ]]; then
        echo "symlink Vim config for root user..."
        sudo ln -siv "$dotfiles/.vimrc" "/root/.vimrc"
        sudo ln -siv "$dotfiles/vim" "/root/.vim"
      fi

			echo "...run update task"
			__bootstrap "update"

      ;;
    "uninstall")

      echo "backup/remove the dotfiles..."
      for i in "${symlinks[@]}"; do
        __dot_remove "$i"
      done

      echo "backup/remove .dotfiles directory..."
      __dot_remove "$dotfiles"

      if [[ "$OSTYPE" == "linux"* ]]; then
        echo "remove Vim config for root user..."
        sudo rm -iv --preserve-root "/root/.vimrc"
        sudo rm -Riv --preserve-root "/root/.vim"
      fi

      ;;
    "update")

      echo "install/update Vim plugins..."
      vim -c "PlugClean! | PlugUpgrade | PlugUpdate | qall"

      echo "update local bin scripts..."
      nu_html_version="16.6.29"
      __get_script "bin/vnu.jar" \
        "https://github.com/validator/validator/releases/download/$nu_html_version/vnu.jar_${nu_html_version}.zip" \
        "dist/vnu.jar"
      markdown_version="1.0.1"
      __get_script "bin/Markdown.pl" \
        "http://daringfireball.net/projects/downloads/Markdown_$markdown_version.zip" \
        "Markdown_${markdown_version}/Markdown.pl"
      __get_script "bin/rsync-tmbackup" \
        "https://github.com/laurent22/rsync-time-backup/raw/master/rsync_tmbackup.sh"
      __get_script "bin/speedtest" \
        "https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py"
      __get_script "bin/cloudapp" \
        "https://raw.github.com/bonifaido/cloudapp-cli/master/cloudapp"
      __get_script "bin/wp" \
        "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

      echo "update bash completions..."
      __get_script "bash/completions/wp_completion.bash" \
        "https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash"
      if command -v npm > /dev/null 2>&1; then
        npm_comp_path="bash/completions/npm_completion.bash"
        npm completion > "$dotfiles/$npm_comp_path"
        echo $npm_comp_path
      fi

      echo "update .iterm2_shell_integration..."
      shell_name=$(basename "$SHELL")
      __get_script "term/iTerm/.iterm2_shell_integration.$shell_name" \
        "https://iterm2.com/misc/${shell_name}_startup.in"

      ;;

    "help"|*)
      echo "Usage: ./bootstrap.sh [ install | uninstall | update | help ]"
      ;;
  esac
}

# Run it !
time {
  __requirement "${dependencies[@]}";
  __bootstrap "$@";
}
