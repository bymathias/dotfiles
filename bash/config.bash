#!/usr/bin/env bash

export HISTCONTROL="erasedups:ignoreboth"
shopt -s histappend
shopt -s cmdhist
export HISTFILESIZE=2000
export HISTSIZE=1000
export HISTTIMEFORMAT='%F %T '  # ISO 8601: %F=%Y-%m-%d, %T=%H:%M:%S
export HISTIGNORE='&:ls:ll:[bf]g:pwd:v:clear:exit:history'

shopt -s checkwinsize
shopt -s cdspell
shopt -s extglob

export EDITOR=nvim
export VISUAL=nvim

unset MAILCHECK
