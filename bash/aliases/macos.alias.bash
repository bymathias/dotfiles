#!/usr/bin/env bash

# Basic
alias ls='ls -G'
alias o='open -a Finder'

# Nginx
alias nginx-start='sudo nginx'
alias nginx-restart='sudo nginx -s reload'
alias nginx-stop='sudo nginx -s stop'
alias nginx-info='sudo nginx -V'
alias nginx-test='sudo nginx -t'

# PHP
alias php-start='launchctl load -w /usr/local/Cellar/php56/5.6.27_4/homebrew.mxcl.php56.plist'
alias php-stop='launchctl unload -w /usr/local/Cellar/php56/5.6.27_4/homebrew.mxcl.php56.plist'

# Mysql
alias mysql-start='mysql.server start'
alias mysql-stop='mysql.server stop'

# Lock screen
alias lock-screen='sleep 2 && /System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
