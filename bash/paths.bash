#!/usr/bin/env bash

__export_d()
{
  [ -d "$1" ] && export PATH="$PATH:$1"
}

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:$PATH"

# Add RVM to PATH for scripting
__export_d "$HOME/.rvm/bin"

# Local bin scripts
__export_d "$HOME/.dotfiles/bin"

# Nginx
__export_d "/opt/nginx/sbin"

# Php
if [[ "$OSTYPE" == "darwin"* ]] && command -v brew > /dev/null 2>&1; then
  __export_d "$(brew --prefix homebrew/php/php56)/bin"
fi
