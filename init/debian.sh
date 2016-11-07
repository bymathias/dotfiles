#!/bin/bash

set -e

# Ask for admin password upfront
sudo -v

# Update, upgrade
sudo apt-get update
sudo apt-get -y dist-upgrade

# -------------------------------------------

# Install build tools libraries reauired
sudo apt-get install -y build-essential libssl-dev cmake libpcre3-dev

# Data transfer tools
sudo apt-get install -y curl wget rsync

# Version control tools
sudo apt-get install -y mercurial git git-extras

# Shell
sudo apt-get install -y bash-completion

# Install Vim and dependencies
sudo apt-get install -y vim-nox
# xclip, required by vim 'gist-vim' plugin
sudo apt-get install -y xclip
# xdg-utils, required by vim 'vim-instant-markdown' plugin
sudo apt-get install -y xdg-utils
# Exuberant Ctags, required by vim 'tagbar'  plugin
sudo apt-get install -y exuberant-ctags
# EditorConfig, required by editorconfig-vim
sudo apt-get install -y editorconfig

# Install Tmux
sudo apt-get install -y tmux

# sudo apt-get install imagemagick
# sudo apt-get install python-pygments

# Database
sudo apt-get install -y mysql-server
# Install MySql
# mysql_secure_installation
# Disable MySql autostart
# sudo update-rc.d -f mysql disable

# Php
sudo apt-get install -y php5-cli php5-cgi php5-fpm php5-mysql php5-gd
# For local development, replace
# sed -i 's/listen = /var/run/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf

# -------------------------------------------

## Final upgrade and clean up
sudo apt-get upgrade
sudo apt-get autoremove
sudo apt-get clean
