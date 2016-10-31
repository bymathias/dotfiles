#!/bin/bash

set -e

# Ask for admin password upfront
sudo -v

# Update, upgrade
sudo apt-get update
sudo apt-get -y dist-upgrade

# -------------------------------------------
# Common packages
# -------------------------------------------

# Install build tools libraries reauired
sudo apt-get install -y build-essential libssl-dev

# Data transfer tools
sudo apt-get install -y curl wget

# Version control tools
sudo apt-get install -y mercurial git git-extras

# Install Vim and dependencies
sudo apt-get install -y vim-nox
# xclip, required by vim 'gist-vim' plugin
sudo apt-get install -y xclip
# xdg-utils, required by vim 'vim-instant-markdown' plugin
sudo apt-get install -y xdg-utils
# Exuberant Ctags, required by vim 'tagbar'  plugin
sudo apt-get install -y exuberant-ctags

# Install Tmux
sudo apt-get install -y tmux


# sudo apt-get install \
#   bash-completion \
#   imagemagick \
#   python-pygments \
#   rsync


# sudo apt-get install \
#   fontforge \
#   gpick \
#   iceweasel \
#   keepassx \
#   scribus \
#   tmux \
#   trimage \
#   vim-nox

# ## Fonts
# sudo apt-get install \
#   fonts-inconsolata \
#   fonts-droid

## Final upgrade and clean up
sudo apt-get upgrade
sudo apt-get autoremove
sudo apt-get clean
