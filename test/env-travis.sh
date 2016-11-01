#!/bin/bash

if [ "$TRAVIS_OS_NAME" = "linux" ]; then

  sudo apt-get update
  sudo apt-get -qqy upgrade

  sudo apt-get install -qqy shellcheck

elif [ "$TRAVIS_OS_NAME" = "osx" ]; then

  brew update
  brew upgrade

  brew install shellcheck

fi
