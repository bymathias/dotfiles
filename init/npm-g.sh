#!/bin/bash

set -e

(npm ls -gp --depth=0 | awk -F/ '/node_modules/ && !/\/npm$/ {print $NF}' | xargs npm -g rmv)

# Update npm
npm install -g npm

# Required by Vim
npm install -g csscomb
npm install -g instant-markdown-d

# Useful web dev tools
npm install -g conventional-changelog-cli
npm install -g docco
# npm install -g jsdoc

# Videos
npm install -g youtube-dl
npm install -g peerflix
npm install -g termflix