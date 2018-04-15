#!/bin/bash

set -e

# Ask for admin password upfront
sudo -v

# Update, upgrade
sudo apt-get update
sudo apt-get -y dist-upgrade

# ========================================== #

# exFAT support
sudo apt-get install -y exfat-utils exfat-fuse

# ========================================== #

# Terminal
sudo apt-get install -y terminator

# Office tools
sudo apt-get install -y geary
sudo apt-get install -y keepassx
sudo apt-get install -y libreoffice

# Graphic tools and fonts
sudo apt-get install -y digikam
sudo apt-get install -y inkscape
sudo apt-get install -y gimp
sudo apt-get install -y gpick
sudo apt-get install -y trimage
sudo apt-get install -y fontforge

# Security
sudo apt-get install -y gufw

# Data transfer
sudo apt-get install -y filezilla
sudo apt-get install -y transmission-gtk

# Media
sudo apt-get install -y vlc

# Backup
sudo apt-get install -y deja-dup

# ========================================== #

## Final upgrade and clean up
sudo apt-get upgrade
sudo apt-get autoremove
sudo apt-get clean
