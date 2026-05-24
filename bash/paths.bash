#!/usr/bin/env bash

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:$PATH"

# Local bin scripts
[[ -d "$HOME/.dotfiles/bin" ]] && export PATH="$PATH:$HOME/.dotfiles/bin"

export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
