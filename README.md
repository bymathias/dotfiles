# [math's](https://github.com/bymathias/dotfiles "Mathias Brouilly") dotfiles

Config files to setup a system (debian/osx) the way I want it.

## Installation

Clone the repository and install:

    git clone https://bymathias@github.com/bymathias/dotfiles.git ~/.dotfiles
    cd .dotfiles
    ./bootstrap.sh install

Edit the [`.gitconfig`](https://github.com/bymathias/dotfiles/blob/master/git/.gitconfig#L1 ".gitconfig") user to fit your details.

Add [iTerm2](http://www.iterm2.com/) color presets

    open "~/.dotfiles/init/Kivabien.itermcolors"

Add [Terminator](http://gnometerminator.blogspot.nl/p/introduction.html) config 

    mv ~/.config/terminator/config ~/.config/terminator/config.defaults.bak
    cp ~/.dotfiles/init/terminator.config ~/.config/terminator/config

## License

Licensed under the [MIT License](https://github.com/bymathias/dotfiles/blob/master/LICENSE.md).
