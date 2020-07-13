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

alias mockup='npm start --prefix ~/app/pencil'
alias lock-screen='sleep 2 && xscreensaver-command -lock'
alias do-upgrade='sudo apt update && sudo apt -y upgrade && sudo apt autoremove && sudo apt clean'
alias serve='python -m SimpleHTTPServer 8080'

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
alias gco='git checkout'
# Updates the remote
alias gps='git push'
# Fetch updates from the remote and rebase
# the local branch with the upstream branch.
# This avoids any merge commits that may occur when using git pull
alias gpl='git pull --rebase'
# Rebases the current branch with another branch
# ex: grb origin/master
alias grb='git rebase'

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
#   Apache
#   Usage: `/etc/init.d/apache2 {start|stop|restart}`
#   Enable/Disable Apache2 at start up: `sudo systemctl {enable|disable} apache2`
# ========================================== #

alias apache2-start='sudo /etc/init.d/apache2 start'
alias apache2-stop='sudo /etc/init.d/apache2 stop'
alias apache2-restart='sudo /etc/init.d/apache2 restart'
alias apache2-status='sudo /etc/init.d/apache2 status'
alias apache2-reload='sudo /etc/init.d/apache2 reload'

# ========================================== #
#   PHP-FPM 7.0
#   Usage: `/etc/init.d/php7.0-fpm {start|stop|status|restart|reload|force-reload}`
#   Enable/Disable PHP at start up: `sudo systemctl {enable|disable} php7.0-fpm`
# ========================================== #

alias php7.0-start='sudo /etc/init.d/php7.0-fpm start'
alias php7.0-stop='sudo /etc/init.d/php7.0-fpm stop'
alias php7.0-restart='sudo /etc/init.d/php7.0-fpm restart'
alias php7.0-reload='sudo /etc/init.d/php7.0-fpm reload'
alias php7.0-status='sudo /etc/init.d/php7.0-fpm status'

# ========================================== #
#   PHP-FPM 7.4
#   Usage: `/etc/init.d/php7.4-fpm {start|stop|status|restart|reload|force-reload}`
#   Enable/Disable PHP at start up: `sudo systemctl {enable|disable} php7.4-fpm`
# ========================================== #

alias php7.4-start='sudo /etc/init.d/php7.4-fpm start'
alias php7.4-stop='sudo /etc/init.d/php7.4-fpm stop'
alias php7.4-restart='sudo /etc/init.d/php7.4-fpm restart'
alias php7.4-reload='sudo /etc/init.d/php7.4-fpm reload'
alias php7.4-status='sudo /etc/init.d/php7.4-fpm status'

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
#   Installed via package:
#   see: https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/
# ========================================== #

alias mongo-start='sudo service mongod start'
alias mongo-stop='sudo service mongod stop'
alias mongo-restart='sudo service mongod restart'
