#!/usr/bin/env bash

alias fa='alias | grep'

# Basic

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alF'
alias ld='ls -l | grep "^d"'

alias h='history'
alias c='clear'
alias q='exit'

alias grep='grep --color=auto'

alias reload='source ~/.bash_profile'
alias path='echo -e ${PATH//:/\\n}'

alias v='vim'
alias e='nvim'
alias o='thunar &'

alias ssa='ssh-add'
alias host-edit='sudoedit /etc/hosts'
alias ip='curl -s http://checkip.dyndns.com/ | sed "s/[^0-9\.]//g"'
alias serve='python -m http.server 8080'

alias now='date +"%d-%m-%Y %T"'
alias week='date +%V'
alias wttr='curl wttr.in -A "curl"'
alias weather='wttr'

# Tmux

alias tx='tmux -q has-session && tmux attach-session -d || tmux new-session -s$USER'
alias tn='tmux new-session -s'
alias ta='tmux attach-session -t'
alias tl='tmux list-session'
alias tk='tmux kill-server'

# Git

alias gaa='git add .'
alias gcm='git commit -m'
alias gcma='git commit -a -m'
alias gnope='git checkout .'
alias gwait='git reset HEAD'
alias gundo='git reset --soft HEAD^'
alias glog='git log --graph --oneline --decorate --all'
alias gck='git checkout'
alias gph='git push'
alias gpl='git pull --rebase'
alias grb='git rebase'
