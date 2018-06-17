#!/usr/bin/env bash

# ========================================== #
#   Basic
# ========================================== #

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias l='ls -F'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alF'
alias ld='ls -l | grep "^d"'

alias h='history'
alias c='clear'
alias q='exit'

alias reload='source ~/.bash_profile'
alias path='echo -e ${PATH//:/\\n}'

alias v='vim'
alias o='thunar &'

alias dbox='cd ~/Dropbox && ls -l'
alias note='cd ~/Dropbox/sync/note && ls -oQ'
alias repo='cd ~/Repos && ls -l'
alias site='cd ~/Sites && ls -l'

alias ssa='ssh-add'
alias ip='curl -s http://checkip.dyndns.com/ | sed "s/[^0-9\.]//g"'
alias host-edit='sudoedit /etc/hosts'

alias now='date +"%d-%m-%Y %T"'
alias week='date +%V'
alias wttr='curl wttr.in -A "curl"'
alias weather='wttr'

alias lock-screen='sleep 2 && xscreensaver-command -lock'

alias jekyll-serve='bundle exec jekyll serve'
alias mockup='npm start --prefix ~/app/pencil'

# ========================================== #
#   Tmux
# ========================================== #

alias t='tmux'
alias tn='tmux new-session -s'
alias ta='tmux attach-session -t'
alias tl='tmux list-session'
alias tk='tmux kill-server'
alias tx='tmux -q has-session && tmux attach-session -d || tmux new-session -s$USER'

# ========================================== #
#   Git
# ========================================== #

alias g='git'
alias ga='git add'
alias gc='git commit'
alias gac='git add --all && git commit -m'
alias gd='git diff'
alias gs='git status'
alias gl='git log'
alias gb='git branch'
alias gt='git checkout'
alias ge='git clone'
alias ghom='git push origin master'
alias glom='git pull origin master'
alias glog='git log --graph --oneline --decorate --all'

# ========================================== #
#   Nginx
#   Usage: `/etc/init.d/nginx {start|stop|restart|reload|force-reload|status|configtest|rotate|upgrade}`
#   Enable/Disable Nginx at start up: `sudo systemctl {enable|disable} nginx`
# ========================================== #

alias nginx-test='sudo /etc/init.d/nginx configtest'
alias nginx-start='sudo /etc/init.d/nginx start'
alias nginx-stop='sudo /etc/init.d/nginx stop'
alias nginx-restart='sudo /etc/init.d/nginx restart'
alias nginx-reload='sudo /etc/init.d/nginx reload'
alias nginx-status='sudo /etc/init.d/nginx status'
alias nginx-upgrade='sudo /etc/init.d/nginx upgrade'

# ========================================== #
#   PHP-FPM 7.0
#   Usage: `/etc/init.d/php7.0-fpm {start|stop|status|restart|reload|force-reload}`
#   Enable/Disable PHP at start up: `sudo systemctl {enable|disable} php7.0-fpm`
# ========================================== #

alias php-start='sudo /etc/init.d/php7.0-fpm start'
alias php-stop='sudo /etc/init.d/php7.0-fpm stop'
alias php-restart='sudo /etc/init.d/php7.0-fpm restart'
alias php-reload='sudo /etc/init.d/php7.0-fpm reload'
alias php-status='sudo /etc/init.d/php7.0-fpm status'

# ========================================== #
#   MariaDB (mysql)
#   Usage: `/etc/init.d/mysql {start|stop|restart|reload|force-reload|status|bootstrap}`
#   Enable/Disable MariaDB at start up: `sudo systemctl enable/disable mysql`
# ========================================== #

alias mysql-start='sudo /etc/init.d/mysql start'
alias mysql-stop='sudo /etc/init.d/mysql stop'
alias mysql-restart='sudo /etc/init.d/mysql restart'
alias mysql-reload='sudo /etc/init.d/mysql reload'
alias mysql-status='sudo /etc/init.d/mysql status'

# ========================================== #
#   MongoDB
#   Usage: /etc/init.d/mongodb {start|stop|force-stop|restart|force-reload|status}`
#   Enable/Disable MongoDB at start up: `sudo systemctl enable/disable mongodb`
# ========================================== #

alias mongo-start='sudo /etc/init.d/mongodb start'
alias mongo-stop='sudo /etc/init.d/mongodb stop'
alias mongo-restart='sudo /etc/init.d/mongodb restart'
alias mongo-status='sudo /etc/init.d/mongodb status'
