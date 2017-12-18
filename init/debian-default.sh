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

# Shell tools and terminal multiplexer
sudo apt-get install -y bash-completion
sudo apt-get install -y tmux

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

# Image optimisation
sudo apt-get install -y imagemagick

# exFAT support
sudo apt-get install -y exfat-utils exfat-fuse

# A shell script static analysis tool
sudo apt-get install -y shellcheck

# sudo apt-get install python-pygments

# -------------------------------------------

# Final upgrade and clean up
sudo apt-get upgrade
sudo apt-get autoremove
sudo apt-get clean
