#!/usr/bin/env bash

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Basic
alias l='ls -F'
alias ll='ls -alF'
alias ld='ls -l | grep "^d"'
alias ls='ls --color=auto --group-directories-first'
alias o='thunar &'
alias h='history'
alias c='clear'
alias q='exit'

alias now='date +"%d-%m-%Y %T"'
alias week='date +%V'

alias reload='source ~/.bash_profile'
alias path='echo -e ${PATH//:/\\n}'

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

# Lock Screen
alias lock-screen='sleep 2 && xscreensaver-command -lock'

# Nginx
# Usage: /etc/init.d/nginx {start|stop|restart|reload|force-reload|status|configtest|rotate|upgrade}
alias nginx-test='sudo /etc/init.d/nginx configtest'
alias nginx-start='sudo /etc/init.d/nginx start'
alias nginx-stop='sudo /etc/init.d/nginx stop'
alias nginx-restart='sudo /etc/init.d/nginx restart'
alias nginx-reload='sudo /etc/init.d/nginx reload'
alias nginx-status='sudo /etc/init.d/nginx status'
alias nginx-upgrade='sudo /etc/init.d/nginx upgrade'
# Enable/Disable Nginx at start up
# sudo systemctl enable/disable nginx

# # PHP-FPM 7.0
# Usage: /etc/init.d/php7.0-fpm {start|stop|status|restart|reload|force-reload}
alias php-start='sudo /etc/init.d/php7.0-fpm start'
alias php-stop='sudo /etc/init.d/php7.0-fpm stop'
alias php-restart='sudo /etc/init.d/php7.0-fpm restart'
alias php-reload='sudo /etc/init.d/php7.0-fpm reload'
alias php-status='sudo /etc/init.d/php7.0-fpm status'
# Enable/Disable PHP at start up
# sudo systemctl enable/disable php7.0-fpm

# MariaDB (mysql)
# Usage: /etc/init.d/mysql {start|stop|restart|reload|force-reload|status|bootstrap}
alias mysql-start='sudo /etc/init.d/mysql start'
alias mysql-stop='sudo /etc/init.d/mysql stop'
alias mysql-restart='sudo /etc/init.d/mysql restart'
alias mysql-reload='sudo /etc/init.d/mysql reload'
alias mysql-status='sudo /etc/init.d/mysql status'
# Enable/Disable MariaDB at start up
# sudo systemctl enable/disable mysql

# MongoDB
# Usage: /etc/init.d/mongodb {start|stop|force-stop|restart|force-reload|status}
alias mongo-start='sudo /etc/init.d/mongodb start'
alias mongo-stop='sudo /etc/init.d/mongodb stop'
alias mongo-restart='sudo /etc/init.d/mongodb restart'
alias mongo-status='sudo /etc/init.d/mongodb status'
# Enable/Disable MongoDB at start up
# sudo systemctl enable/disable mongodb
