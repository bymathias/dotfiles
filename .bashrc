#!/bin/bash
# shellcheck source=/dev/null
#
# ~/.bashrc

DOT_BASH="$HOME/.dotfiles/bash"

__source_exists() {
  [[ -r "$1" ]] && [[ -f "$1" ]] && . "$1"
}

__command_exists() {
  command -v "$1" > /dev/null 2>&1
}

export -f __source_exists
export -f __command_exists

# Bash configurations
for i in config colors prompt paths aliases functions completions; do
  __source_exists "$DOT_BASH/$i.bash"
done

# Load NVM
__source_exists "$HOME/.nvm/nvm.sh"

# (last) Load RVM into a shell session *as a function*
__source_exists "$HOME/.rvm/scripts/rvm"

unset DOT_BASH
unset __source_exists
unset __command_exists
