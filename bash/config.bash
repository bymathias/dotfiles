#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

# Don't put duplicate lines in the history
export HISTCONTROL="erasedups:ignoreboth"
# Append to the history file, don't overwrite it
shopt -s histappend
# Save multi-line commands as one command
shopt -s cmdhist
# Set history length
export HISTFILESIZE=2000
export HISTSIZE=1000
# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
export HISTTIMEFORMAT='%F %T '
# Ignore common commands
export HISTIGNORE='&:ls:ll:[bf]g:pwd:v:clear:exit:history'

# Make bash check its window size after a process completes
shopt -s checkwinsize
# Allow bash to correct small typos
shopt -s cdspell
# Extended pattern matching
shopt -s extglob

# Vim everywhere
export EDITOR=vim
export VISUAL=vim

# Set 256color
export TERM=xterm-256color

# Don't check mail when opening terminal
unset MAILCHECK
