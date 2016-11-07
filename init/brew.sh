#!/bin/bash

# Install tools using Homebrew
# see: http://brew.sh/

# Make sure we’re using the latest Homebrew
brew update
# Upgrade any already-installed formulae
brew upgrade

# -------------------------------------------

# Install GNU core utilities
# Add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils

# Data transfer
brew install curl
brew install wget --with-iri

# Version control
brew install mercurial
brew install git
brew install git-extras

# Shell
brew install bash-completion

# Text Editor
brew install vim --with-override-system-vi
# Exuberant Ctags, required by vim 'tagbar'  plugin
brew install ctags
# EditorConfig, required by editorconfig-vim
brew install editorconfig

# Terminal multiplexer
brew install tmux
# Patch for OS X pbpaste and pbcopy
# see: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard/issues/8#issuecomment-9576743
brew install reattach-to-user-namespace

# Building tools
# brew install cmake
# brew install pcre

# brew install openssl

# brew install imagemagick --with-webp
# brew install phantomjs
# brew install webkit2png

# brew install htop-osx
# brew install tree
# brew install shellcheck

# Database
# Install MySql
brew install mysql
# mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
# mysql.server start
# /usr/local/Cellar/mysql/5.7.16/bin/mysql_secure_installation

# Php
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew install php56 --with-mysql --with-fpm --with-homebrew-openssl

# -------------------------------------------

# Remove outdated versions from the cellar
brew cleanup
