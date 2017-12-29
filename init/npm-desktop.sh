#!/bin/bash

set -e

# Update npm
npm install -g npm

# -------------------------------------------

# Required by Vim
npm install -g csscomb
npm install -g instant-markdown-d

# Web development tools
npm install -g js-beautify
npm install -g jsdoc
npm install -g commitizen
npm install -g cz-conventional-changelog
npm install -g conventional-changelog-cli

# Videos tools
npm install -g youtube-dl