#!/bin/bash
# shellcheck source=/dev/null
#
# Install, uninstall and update the .dotfiles
#   see: https://github.com/bymathias/dotfiles

#set -euo pipefail
set -e

dot_directory="$HOME/.dotfiles"
file_symlinks=(bashrc bash_profile vim vimrc editorconfig gitconfig curlrc wgetrc tmux.conf)
# git_repository="https://github.com/bymathias/dotfiles.git"
git_infos=(user.name user.email github.user)

#tmp_directory=$(mktemp -dq ~/tmp/dotfiles.XXXXXX)
ext_backup="$(date +'%Y-%m-%d').backup"

# ================================================
#   Helper functions
# ================================================

# Print output underlined
fn_print_info() {
  printf "\n[i] \e[0;4m%s\e[0m\n" "$1"
}

# Print output in green
fn_print_success() {
  printf "\e[0;32m[✔] %s\e[0m\n" "$1"
}

# Print output in red
fn_print_error() {
  printf "\e[0;31m[✖] %s\e[0m\n" "$1"
}

# Print output in yellow
fn_print_question() {
  printf "\e[0;33m[?] %s: \e[0m" "$1"
}

fn_print_log() {
  if [[ "$1" -ne 0 ]]; then
    fn_print_error "$2 failed"
  else
    fn_print_success "$2"
  fi
}

# Ask question, timeout after 8s with 'Yes' as default.
# fn_ask() {
#   fn_print_question "$1 (y/n)"
#   read -n 1 -t 8
#   REPLY=${REPLY:-y}
#   printf "\n"
# }

# Return 0 if the answer is y/yes/Y/Yes
# fn_ask_is_yes() {
# 	[[ "$REPLY" =~ ^[Yy]$ ]] && return 0 || return 1
# }

# Check if command exists
fn_cmd_exists() {
  command -v "$1" > /dev/null 2>&1
}

# Return 0 if this is a desktop environment
fn_env_is_desktop() {
  [[ ! -z $DESKTOP_SESSION ]] && return 0 || return 1
}

# Remove symlinks and backup files/directories
fn_file_remove() {
  if [ -h "$1" ]; then
    rm "$1"
    fn_print_log "$?" "Remove \"$1\" symlink"
  elif [ -f "$1" ] || [ -d "$1" ]; then
    mv "$1" "$1.$ext_backup"
    fn_print_log "$?" "Backup \"$1\" to \"$1.$ext_backup\""
  fi
}

# Symlink helper
fn_file_symlink() {
  fn_file_remove "$2" && ln -s "$1" "$2"
  fn_print_log "$?" "Create symlink \"$1\" -> \"$2\""
}

# Edit `gitconfig` user infos
fn_edit_gitconfig() {
  local info
  info=$(git config --global --get "$1" || echo "")

  if [ -z "$info" ]; then
    fn_print_question "Enter your git \"$1\""
    read -r -t 10 ans
    info=$ans
  fi

  git config --file "$dot_directory/gitconfig" --replace-all "$1" "$info"
  fn_print_log "$?" "Edit git \"$1\" to \"$info\""
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
      # =========================================================
      # - Edit `.gitconfig` user infos, ASK user if none found
      # - Symlink `.dotfiles` files in home directory
      # - Vim plugins installation with vim-plug
      # - If desktop env, symlink app's config files

      fn_print_info "Edit \".gitconfig\" infos.."
      for i in "${git_infos[@]}"; do
        fn_edit_gitconfig "$i"
      done

      fn_print_info "Create \".dotfiles\" symlinks.."
      for i in "${file_symlinks[@]}"; do
        fn_file_symlink "$dot_directory/$i" "$HOME/.$i"
      done

      fn_print_info "Install Vim plugins with vim-plug.."
      vim +PlugInstall +qall
      fn_print_log "$?" "Vim install"

      if fn_env_is_desktop; then
        fn_print_info "DESKTOP env: Symlink app's configuration.."

        if fn_cmd_exists "terminator"; then
          fn_file_symlink "$dot_directory/config/terminator/terminator.config" "$HOME/.config/terminator/config"
        fi
        if fn_cmd_exists "conky"; then
          fn_file_symlink "$dot_directory/config/conky/conkyrc" "$HOME/.conkyrc"
        fi
      fi

      ;;
    "uninstall")
      # =========================================================
      # - Remove `.dotfiles` symlinks in home directory
      # - Remove/backup `.dotfiles` directory
      # - If desktop env, remove symlink app's config files

      fn_print_info "Remove \".dotfiles\" symlinks.."
      for i in "${file_symlinks[@]}"; do
        fn_file_remove "$i"
      done

      fn_print_info "Backup \".dotfiles\" directory.."
      fn_file_remove "$dot_directory"

      if fn_env_is_desktop; then
        fn_print_info "DESKTOP env: Remove symlinks app's configuration.."

        if fn_cmd_exists "terminator"; then
          fn_file_remove "$HOME/.config/terminator/config"
        fi
        if fn_cmd_exists "conky"; then
          fn_file_remove "$HOME/.conkyrc"
        fi
      fi

      ;;
    "update")
      # =========================================================
      # - Vim plugins with vim-plug
      #   - Remove unused directories (bang version will clean without prompt)
      #   - Upgrade vim-plug itself
      #   - Install or update plugins

      fn_print_info "Update Vim plugins with vim-plug.."
      vim +PlugClean! +PlugUpgrade +PlugUpdate +qall
      fn_print_log "$?" "Vim update"

      ;;
    "test")
      # =========================================================

      fn_print_info "Print info"
      fn_print_success "Print success"
      fn_print_error "Print error"
      fn_print_question "Print question"

      ;;
    "help"|*)
      # =========================================================

      fn_print_info "Usage:"
      echo ""
      echo "  ./bootstrap.sh [ install | uninstall | update | help ]"
      echo ""

      ;;
  esac
}

time { fn_bootstrap "$@"; }
