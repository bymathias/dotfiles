#!/usr/bin/env bash
#
# Install tools using Homebrew
# see: http://brew.sh/

# Make sure we’re using the latest Homebrew
brew update
# Upgrade any already-installed formulae
brew upgrade

# Tap
brew tap homebrew/dupes
brew tap homebrew/versions

# -------------------------------------------

# Install GNU core utilities
# Add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils

brew install htop-osx
brew install tree

# Building tools libraries
brew install cmake
brew install pcre

brew install openssl
# sudo ln -sv /usr/local/Cellar/openssl/1.0.2j/bin/openssl /usr/local/bin
# sudo ln -sv /usr/local/Cellar/openssl/1.0.2j/include/openssl /usr/local/include

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

brew install imagemagick --with-webp
# brew install phantomjs
# brew install webkit2png

brew install shellcheck

# Database
# Install MySql
# brew install mysql
# Start MySql
#mysql.server start
# Secure MySql installation
#mysql_secure_installation
# Launchd start mysql now and restart at login
#brew services start mysql

# Php
# brew tap homebrew/homebrew-php
# brew install php56 --with-mysql --with-fpm --with-homebrew-openssl

# Syncthing
# brew install syncthing
# Auto start syncthing
#brew services start syncthing

# -------------------------------------------

# Remove outdated versions from the cellar
brew cleanup
