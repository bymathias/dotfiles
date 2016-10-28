#!/bin/bash

# Install tools using Homebrew
# see: http://brew.sh/

# Make sure we’re using the latest Homebrew
brew update
# Upgrade any already-installed formulae
brew upgrade

# -------------------------------------------
# Common packages
# -------------------------------------------

brew install coreutils

brew install git
brew install git-extras
brew install mercurial

brew install tmux
brew install vim --with-override-system-vi --with-lua

brew install wget --with-iri

brew install pcre
brew install openssl

brew install imagemagick --with-webp
brew install phantomjs
brew install webkit2png

brew install htop-osx
brew install tree
brew install shellcheck
brew install speedtest_cli
brew install youtube-dl

brew install mysql
brew install mongodb

## Patch for OS X pbpaste and pbcopy
## see: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard/issues/8#issuecomment-9576743
brew install reattach-to-user-namespace

# Install php
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew install php56 --with-mysql --with-fpm --with-homebrew-openssl

# -------------------------------------------
# macOS applications
# -------------------------------------------

brew cask install firefox
brew cask install google-chrome-canary

brew cask install iterm2
brew cask install atom

brew cask install imagealpha
brew cask install imageoptim
brew cask install colorschemer-studio

brew cask install dropbox
brew cask install keepassx
brew cask install the-unarchiver
brew cask install transmission
brew cask install transmit
brew cask install virtualbox
brew cask install vlc

brew cask install appcleaner
brew cask install clamxav
brew cask install onyx


# Remove outdated versions from the cellar
brew cleanup
