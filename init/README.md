(work in progress..)

# Setting up a new machine (debian/osx)

## Dev Tools (required)

#### Mac

Install Command Line Tools for [Xcode](https://developer.apple.com/xcode/).

#### Debian

Install essentials packages.

    ./dotfiles/init/debian_dev

## Ruby

#### Mac & Debian

Install [Ruby](https://www.ruby-lang.org/en/) (ex: 2.1.1) using [rvm](https://rvm.io/).

    curl -sSL https://get.rvm.io | bash -s --ignore-dotfiles stable

    rvm install 2.1.1
    rvm use 2.1.1
    rvm rubygems current

    source ~/.bash_profile
    rvm -v
    gem -v

## Node.js

#### Mac & Debian

Install [Node.js](http://nodejs.org/) (ex: 0.10.28) using [nvm](https://github.com/creationix/nvm).

    git clone https://github.com/creationix/nvm.git ~/.nvm
    source ~/.bash_profile

    nvm install 0.10.28
    nvm use 0.10.28
    nvm alias default 0.10.28

    source ./bash_profile
    node -v
    npm -v

## Nginx

## Defaults

## Terminal setup

#### Mac

[iTerm2](http://www.iterm2.com/) color presets.

    open "~/.dotfiles/init/Kivabien.itermcolors"

#### Debian

[Terminator](http://gnometerminator.blogspot.nl/p/introduction.html) config.

    mv ~/.config/terminator/config ~/.config/terminator/config.defaults.bak
    cp ~/.dotfiles/init/terminator.config ~/.config/terminator/config
