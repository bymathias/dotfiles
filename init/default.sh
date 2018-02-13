#!/bin/bash

set -e

# Ask for admin password upfront
sudo -v

# Update, upgrade
sudo apt-get update
sudo apt-get -y dist-upgrade

# ========================================== #

# Packages required to build
sudo apt-get install -y build-essential libssl-dev cmake libpcre3-dev

# Data transfer tools
sudo apt-get install -y curl wget rsync

# Version control tools
sudo apt-get install -y mercurial git git-extras

# Shell tools
sudo apt-get install -y bash-completion

# Terminal multiplexer
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

# A shell script static analysis tool
sudo apt-get install -y shellcheck

# Syntax highlighting package
sudo apt-get install -y python-pygments

# ========================================== #

if command -v "npm" > /dev/null 2>&1; then
  # Update npm
  npm install -g npm

  # Vim dependencies
  # csscomb, required by vim 'vim-csscomb' plugin
  npm install -g csscomb
  # instant-markdown-d, required by vim 'vim-instant-markdown' plugin
  npm install -g instant-markdown-d

  # Javascript tools
  npm install -g js-beautify
  npm install -g jsdoc

  # Git helpers
  npm install -g commitizen
  npm install -g cz-conventional-changelog
  npm install -g conventional-changelog-cli

  # Javascript frameworks
  # Angular cli
  npm install -g @angular/cli
  # Vue.js
  npm install -g @vue/cli

  # System monitoring dashboard for terminal
  npm install -g gtop
  # UI for git
  npm install -g ungit
fi

# ========================================== #

# Final upgrade and clean up
sudo apt-get upgrade
sudo apt-get autoremove
sudo apt-get clean
