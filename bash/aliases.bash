# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Basic
alias l='ls -F'
alias ll='ls -alF'
alias ld='ls -l | grep "^d"'
alias h='history'
alias c='clear'
alias q='exit'

alias now='date +"%d-%m-%Y %T"'
alias week='date +%V'

alias path='echo -e ${PATH//:/\\n}'
alias reload='source ~/.bash_profile'

# Editor
alias v='vim'

# Tmux
alias t='tmux'
alias tn='tmux new-session -s'
alias ta='tmux attach-session -t'
alias tl='tmux list-session'
alias tk='tmux kill-server'
alias tx='tmux -q has-session && tmux attach-session -d || tmux new-session -s$USER'

# Git
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gac='git add --all && git commit -m'
alias gd='git diff'
alias gs='git status'
alias gb='git branch'
alias gh='git push'
alias gl='git pull'
alias ghom='git push origin master'
alias glom='git pull origin master'
alias gt='git checkout'
alias ge='git clone'

# Path
alias dots='cd ~/.dotfiles && vim'
alias dbox='cd ~/Dropbox && ls'
alias note='cd ~/Dropbox/Notes && vim'
alias site='cd ~/Sites && ls'
alias repo='cd ~/Repos && ls'

# Dotfiles
alias dotfiles='sh ~/.dotfiles/bootstrap.sh'

# IP
alias ip='curl -s http://checkip.dyndns.com/ | sed "s/[^0-9\.]//g"'

# SSH
alias ssa='ssh-add'

# Localhost
alias host-edit='sudo vim /etc/hosts'

# Nu Html Checker
alias nu-html-checker='java -jar ~/.dotfiles/bin/vnu.jar'

# Markdown to Html
alias markdown-to-html='perl ~/.dotfiles/bin/Markdown.pl --html4tags'

# Get the weather for your current location using wttr.in
alias wttr='curl wttr.in -A "curl"'
alias weather='wttr'
