#!/bin/bash
# shellcheck source=/dev/null
#
# ./bootstrap.sh
#
# Install, uninstall and update the .dotfiles
# see: https://github.com/bymathias/dotfiles

# set -euo pipefail

declare dot_directory="$HOME/.dotfiles"
declare dot_symlinks=(.bashrc .bash_profile .gitconfig .vim .vimrc .tmux.conf .inputrc .curlrc .wgetrc .editorconfig .czrc)
declare dot_gitinfos=(user.name user.email github.user)
declare dot_gitrepos="https://github.com/bymathias/dotfiles.git"

declare dot_tmpdir=$(mktemp -dq ~/tmp/dotfiles.XXXXXX)

# ========================================================
# Helper functions
# ========================================================

__cmd_exists() {
  command -v "$1" > /dev/null 2>&1
}

# Prompt for git user infos if none found
__edit_gitconfig() {
  local info
  info=$(git config --global --get "$1" || echo "")

  if [ -z "$info" ]; then
    echo "Enter your git '$1':"
    read -r ans
    info=$ans
  else
    echo "Git '$1' edited to '$info'"
  fi

  git config --file "$dot_directory/git/.gitconfig" --replace-all "$1" "$info"
}

# Remove symlinks and backup files/directories
__file_remove() {
  local file="$HOME/$1"

  if [ -h "$file" ]; then
    rm -v "$file"
  elif [ -f "$file" ] || [ -d "$file" ]; then
    mv -v "$file" "$file.$(date + '%Y-%m-%d').bak"
  fi
}

# Symlink dotfiles in $HOME
__file_symlink() {
  local file="$HOME/$1"

  if [ "$1" == ".gitconfig" ]; then
    ln -sv "$dot_directory/git/$1" "$file"
  elif [ "$1" == ".vim" ]; then
    ln -sv "$dot_directory/vim" "$file"
  else
    ln -sv "$dot_directory/$1" "$file"
  fi
}

# Use curl or wget
__download() {
  local url="$1"
  local out="$2"

  if __cmd_exists "curl"; then
    curl -Lo "$out" "$url" --create-dirs &> /dev/null
    return $?
  elif __cmd_exists "wget"; then
    mkdir -p "$(dirname $out)"
    wget -O "$out" "$url" &> /dev/null
    return $?
  fi

  return 1
}

# Download external scripts
__download_script() {
  local arr=("$@")
  local out=${@: -1}
  local file="$dot_directory/$out"
  local temp="$dot_tmpdir/$out"

  [ -f "$file" ] && rm "$file"

  if [ ${#arr[@]} -lt 3 ]; then
    __download "$1" "$file"
  else
    __download "$1" "$temp.zip"
    unzip -d "$temp" -qo "$temp.zip"
    mv "$temp/$2" "$file"
  fi

  chmod +x "$file" && echo "$(basename $file)"
}

# ========================================================
# Main functions
# ========================================================

# Main function
__bootstrap()
{
  if [ $# -ne 1 ]; then
    __bootstrap help
    return
  fi
  case "$1" in
    "install")

      if [[ ! -d "$dot_directory" ]]; then
        if __cmd_exists "git"; then
          git clone "$dot_gitrepos" "$dot_directory"
        else
          __download "$dot_gitrepos" "$dot_directory"
        fi
      fi

      if __cmd_exists "git"; then
        for i in "${dot_gitinfos[@]}"; do
          __edit_gitconfig "$i"
        done
      fi

      for i in "${dot_symlinks[@]}"; do
        __file_remove "$i"
        __file_symlink "$i"
      done

			__bootstrap "update"

      ;;
    "uninstall")

      for i in "${dot_symlinks[@]}"; do
        __file_remove "$i"
      done

      __file_remove "$dot_directory"

      ;;
    "update")

      # Vim plugins with vim-plug
      # - Remove unused directories (bang version will clean without prompt)
      # - Upgrade vim-plug itself
      # - Install or update plugins
      vim +PlugClean! +PlugUpgrade +PlugUpdate +qall

      # The Nu Html Checker
      # ref: http://validator.github.io/validator
      local nu_html_version="16.6.29"
      __download_script \
        "https://github.com/validator/validator/releases/download/$nu_html_version/vnu.jar_${nu_html_version}.zip" \
        "dist/vnu.jar" \
        "bin/vnu.jar"

      # Markdown is a text-to-HTML conversion tool
      # ref: http://daringfireball.net/projects/markdown
      local markdown_version="1.0.1"
      __download_script \
        "http://daringfireball.net/projects/downloads/Markdown_$markdown_version.zip" \
        "Markdown_${markdown_version}/Markdown.pl" \
        "bin/Markdown.pl"

      # Time Machine-style backup using rsync
      # ref: https://github.com/laurent22/rsync-time-backup
      __download_script \
        "https://github.com/laurent22/rsync-time-backup/raw/master/rsync_tmbackup.sh" \
        "bin/rsync-tmbackup"

      # Command line interface for testing internet bandwidth using speedtest.net
      # ref: https://github.com/sivel/speedtest-cli
      __download_script \
        "https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py" \
        "bin/speedtest"

      # A simple cli for CloudApp written in Ruby
      # ref: https://github.com/bonifaido/cloudapp-cli
      __download_script \
        "https://raw.github.com/bonifaido/cloudapp-cli/master/cloudapp" \
        "bin/cloudapp"

      # WP-CLI is a set of command-line tools for managing WordPress installations
      # ref: http://wp-cli.org
      __download_script \
        "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" \
        "bin/wp"
      __download_script \
        "https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash" \
        "bash/completions/wp_completion.bash"

      # Node package manager completion
      if __cmd_exists "npm"; then
        local npm_comp_path="bash/completions/npm_completion.bash"
        npm completion > "$dot_directory/$npm_comp_path"
        echo "$(basename $npm_comp_path)"
      fi

      ;;
    "help"|*)

      echo "Usage:"
      echo ""
      echo "  ./bootstrap.sh [ install | uninstall | update | help ]"
      echo ""

      ;;
  esac
}

# run it
time { __bootstrap "$@"; }
