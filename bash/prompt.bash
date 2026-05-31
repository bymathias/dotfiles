#!/usr/bin/env bash

if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    # shellcheck source=/dev/null
    source /usr/share/git/completion/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1     # * unstaged, + staged
    export GIT_PS1_SHOWSTASHSTATE=1     # $ stashed
    export GIT_PS1_SHOWUNTRACKEDFILES=1 # % untracked
    export GIT_PS1_SHOWUPSTREAM="auto"  # >, <, = relative to upstream

    if [ "$EUID" -ne 0 ]; then
        PS1='\[\e[34m\][\u@\[\e[32m\]\h\[\e[34m\]]\[\e[m\]:\[\e[33m\]\w\[\e[m\]$(__git_ps1 " (%s)")\n\$\[\e[m\] '
    else
        PS1='\[\e[31m\][\u@\[\e[32m\]\h\[\e[31m\]]\[\e[m\]:\[\e[33m\]\w\[\e[m\]$(__git_ps1 " (%s)")\n\#\[\e[m\] '
    fi
else
    if [ "$EUID" -ne 0 ]; then
        PS1='\[\e[34m\][\u@\[\e[32m\]\h\[\e[34m\]]\[\e[m\]:\[\e[33m\]\w\[\e[m\]\n\$\[\e[m\] '
    else
        PS1='\[\e[31m\][\u@\[\e[32m\]\h\[\e[31m\]]\[\e[m\]:\[\e[33m\]\w\[\e[m\]\n\#\[\e[m\] '
    fi
fi
