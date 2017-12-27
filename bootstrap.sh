#!/bin/bash
# shellcheck source=/dev/null
#
# Install, uninstall and update the .dotfiles
#   see: https://github.com/bymathias/dotfiles

# set -euo pipefail


tmp_directory=$(mktemp -dq ~/tmp/dotfiles.XXXXXX)
ext_backup="$(date +'%Y-%m-%d').backup"

dot_directory="$HOME/.dotfiles"
file_symlinks=(bashrc bash_profile vim vimrc editorconfig gitconfig curlrc wgetrc tmux.conf)

git_infos=(user.name user.email github.user)
git_repository="https://github.com/bymathias/dotfiles.git"

# ================================================
#   Helper functions
# ================================================

# Print output underlined
fn_print_info() {
  printf "\n\e[0;4m$1\e[0m\n"
}

# Print output in green
fn_print_success() {
  printf "\e[0;32m[✔] $1\e[0m\n"
}

# Print output in red
fn_print_error() {
  printf "\e[0;31m[✖] $1\e[0m\n"
}

# Print output in yellow
fn_print_question() {
  printf "\e[0;33m[?] $1: \e[0m"
}

# Ask question, timeout after 8s with 'Yes' as default.
fn_ask() {
  fn_print_question "$1 (y/n)"
  read -n 1 -t 8
  REPLY=${REPLY:-y}
  printf "\n"
}

# Return 0 if the answer is y/yes/Y/Yes
fn_ask_is_yes() {
	[[ "$REPLY" =~ ^[Yy]$ ]] && return 0 || return 1
}

# Check if command exists
fn_cmd_exists() {
  command -v "$1" > /dev/null 2>&1
}

# Remove symlinks and backup files/directories
fn_file_remove() {
  if [ -h "$1" ]; then
    rm -v "$1"
  elif [ -f "$1" ] || [ -d "$1" ]; then
    mv -v "$1" "$1.$ext_backup"
  fi
}

fn_file_symlink() {
  local link="$2$1"

  fn_file_remove "$link"
  ln -sv "$dot_directory/$1" "$link"
}

fn_edit_gitconfig() {
  local info
  info=$(git config --global --get "$1" || echo "")

  if [ -z "$info" ]; then
    fn_print_question "Enter your git \"$1\""
    read -r -t 10 ans
    info=$ans
  fi

  git config --file "$dot_directory/gitconfig" --replace-all "$1" "$info"
}

# ================================================
#   Main `bootstrap.sh` function
# ================================================

fn_bootstrap() {
  if [ $# -ne 1 ]; then
    fn_bootstrap help
    return
  fi
  case "$1" in

    "install")

      fn_print_info "Edit \"git\" infos user.."
      for i in "${git_infos[@]}"; do
        fn_edit_gitconfig "$i"
      done

      fn_print_info "Symlink .dotfiles to home.."
      for i in "${file_symlinks[@]}"; do
        fn_file_symlink "$i" "$HOME/."
      done

      fn_print_info "Install vim plugins.."
      vim +PlugInstall +qall

      ;;

    "uninstall")

      fn_print_info "Remove symlinks and move .dotfiles folder.."
      for i in "${file_symlinks[@]}"; do
        fn_file_remove "$i"
      done
      fn_file_remove "$dot_directory"

      ;;

    "update")

      # Vim plugins with vim-plug
      # - Remove unused directories (bang version will clean without prompt)
      # - Upgrade vim-plug itself
      # - Install or update plugins
      vim +PlugClean! +PlugUpgrade +PlugUpdate +qall

      ;;

    "help"|*)

      echo "Usage:"
      echo ""
      echo "  ./bootstrap.sh [ install | uninstall | update | help ]"
      echo ""

      ;;
  esac
}

time { fn_bootstrap "$@"; }
