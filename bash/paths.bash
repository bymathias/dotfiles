#!/usr/bin/env bash

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:$PATH"

# (first) Add RVM to PATH for scripting
[[ -d "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"

# Local bin scripts
[[ -d "$HOME/.dotfiles/bin" ]] && export PATH="$PATH:$HOME/.dotfiles/bin"
