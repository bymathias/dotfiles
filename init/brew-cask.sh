#!/bin/bash

# Install tools using Homebrew
# see: http://brew.sh/

# Make sure we’re using the latest Homebrew
brew update
# Upgrade any already-installed formulae
brew upgrade

# -------------------------------------------

brew cask install firefox
brew cask install google-chrome
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

# -------------------------------------------

# Remove outdated versions from the cellar
brew cleanup
