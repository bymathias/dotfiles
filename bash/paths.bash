#!/usr/bin/env bash

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:$HOME/.local/bin:$PATH"

# Local bin scripts
[[ -d "$HOME/.dotfiles/bin" ]] && export PATH="$PATH:$HOME/.dotfiles/bin"


export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    _nvm_lazy_load() {
        unset -f nvm node npm npx
        # shellcheck source=/dev/null
        \. "$NVM_DIR/nvm.sh"
        # shellcheck source=/dev/null
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
        "$1" "${@:2}"
    }
    nvm()  { _nvm_lazy_load nvm  "$@"; }
    node() { _nvm_lazy_load node "$@"; }
    npm()  { _nvm_lazy_load npm  "$@"; }
    npx()  { _nvm_lazy_load npx  "$@"; }
fi
