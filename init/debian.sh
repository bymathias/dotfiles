#!/bin/bash

set -e

## Ask for admin password upfront
sudo -v

## Update, upgrade
sudo apt-get update
sudo apt-get -y dist-upgrade

sudo apt-get install \
  bash-completion \
  curl \
  exuberant-ctags \
  git \
	git-extras \
  imagemagick \
  mercurial \
  python-pygments \
  rsync \
  wget

sudo apt-get install \
  fontforge \
  gpick \
  iceweasel \
  keepassx \
  scribus \
  tmux \
  trimage \
  vim-nox

## Fonts
sudo apt-get install \
  fonts-inconsolata \
  fonts-droid

## Final upgrade and clean up
sudo apt-get upgrade
sudo apt-get autoremove
sudo apt-get clean
