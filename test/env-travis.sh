#!/bin/bash

if [ "$TRAVIS_OS_NAME" = "linux" ]; then

  sudo apt-get update
  sudo apt-get -y upgrade

  sudo apt-get install -y shellcheck

elif [ "$TRAVIS_OS_NAME" = "osx" ]; then

  brew update
  brew upgrade

  brew install shellcheck

fi
