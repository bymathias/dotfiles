#!/usr/bin/env bash
#
# Install tools using Homebrew
# see: http://brew.sh/

# Make sure we’re using the latest Homebrew
brew update
# Upgrade any already-installed formulae
brew upgrade

# Tap
brew tap caskroom/versions

# -------------------------------------------

# Terminal and text editor
brew cask install iterm2
brew cask install atom

# Web browsers
brew cask install firefox
brew cask install firefoxnightly
brew cask install google-chrome
brew cask install google-chrome-canary

# Office tools
brew cask install dropbox
brew cask install keepassx
brew cask install the-unarchiver
brew cask install libreoffice

# Graphic tools
# `xquartz` is required by Inkscape
brew cask install xquartz inkscape
brew cask install gimp
brew cask install colorschemer-studio
# Image optimisation
brew cask install imagealpha
brew cask install imageoptim

# Web development tools
brew cask install kaleidoscope
brew cask install poedit
brew cask install virtualbox

# Messaging apps
brew cask install skype
brew cask install telegram

# Data transfer
brew cask install transmit
brew cask install transmission

# Video tools
brew cask install handbrake
brew cask install vlc

# Security and cleaning
brew cask install appcleaner
brew cask install onyx
brew cask install oversight

# Screensaver
brew cask install fliqlo

# Custom fonts
brew tap caskroom/fonts
brew cask install font-inconsolata
brew cask install font-hack
brew cask install font-camingocode
brew cask install font-ubuntu
brew cask install font-droid-sans-mono

# -------------------------------------------

# Remove outdated versions from the cellar
brew cleanup
