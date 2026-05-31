#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Helper to source files
DOT_BASH="$HOME/.dotfiles/bash"
__source_exists() {
    [[ -r "$1" ]] && [[ -f "$1" ]] && . "$1"
}
export -f __source_exists

# Source Bash configurations
for i in config prompt paths aliases functions completions; do
    __source_exists "$DOT_BASH/$i.bash"
done
