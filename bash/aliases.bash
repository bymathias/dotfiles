#!/usr/bin/env bash

# Find aliases
# ex: fa git
alias fa='alias | grep'

# ========================================== #
#   Basic
# ========================================== #

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

# ========================================== #
#   Tmux
# ========================================== #

alias tx='tmux -q has-session && tmux attach-session -d || tmux new-session -s$USER'
alias tn='tmux new-session -s'
alias ta='tmux attach-session -t'
alias tl='tmux list-session'
alias tk='tmux kill-server'

# ========================================== #
#   Git
# ========================================== #

# Adds all changes to staging
alias gaa='git add .'
# Creates a new commit with all staged files
# and uses the given message as the commit's message
alias gcm='git commit -m'
# Adds all files to staging and makes a commit
# using the given message as the commit's message
alias gcma='git commit -a -m'
# Removes all the changes detected by Git
alias gnope='git checkout .'
# Unstages everything
alias gwait='git reset HEAD'
# Undoes the last commit and moves the files in the commit to staging
alias gundo='git reset --soft HEAD^'
# Logs previous commits in a concise manner
alias glog='git log --graph --oneline --decorate --all'
# Allows to switch between branches
alias gck='git checkout'
# Updates the remote
alias gph='git push'
# Fetch updates from the remote and rebase
# the local branch with the upstream branch.
# This avoids any merge commits that may occur when using git pull
alias gpl='git pull --rebase'
# Rebases the current branch with another branch
# ex: grb origin/master
alias grb='git rebase'
