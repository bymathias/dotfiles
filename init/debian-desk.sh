#!/bin/bash

set -e

# Ask for admin password upfront
sudo -v

# Update, upgrade
sudo apt-get update
sudo apt-get -y dist-upgrade

# -------------------------------------------

sudo apt-get install -y terminator
sudo apt-get install -y geany

sudo apt-get install -y iceweasel
sudo apt-get install -y chromium

sudo apt-get install -y keepassx
sudo apt-get install -y claws-mail
sudo apt-get install -y libreoffice
sudo apt-get install -y scribus
sudo apt-get install -y atril

sudo apt-get install -y inkscape
sudo apt-get install -y gimp
sudo apt-get install -y trimage
sudo apt-get install -y gpick
sudo apt-get install -y fontforge
sudo apt-get install -y filezilla

sudo apt-get install -y transmission-gtk
sudo apt-get install -y vlc

# sudo apt-get install -y gufw

# # Fonts
# sudo apt-get install \
#   fonts-inconsolata \
#   fonts-droid

# -------------------------------------------

## Final upgrade and clean up
sudo apt-get upgrade
sudo apt-get autoremove
sudo apt-get clean
