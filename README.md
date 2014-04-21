# [Math's](https://github.com/bymathias/dotfiles "Mathias Brouilly") dotfiles

Config files to setup a system (debian/osx) the way I want it.

## Installation

Clone the repository and install.

    git clone https://bymathias@github.com/bymathias/dotfiles.git ~/.dotfiles
    cd .dotfiles
    ./bootstrap.sh install

Edit the [`.gitconfig`](https://github.com/bymathias/dotfiles/blob/master/git/.gitconfig#L1 ".gitconfig") user to fit your details.

#### Terminal setup

[iTerm2](http://www.iterm2.com/) color presets.

    open "~/.dotfiles/init/Kivabien.itermcolors"

[Terminator](http://gnometerminator.blogspot.nl/p/introduction.html) config.

    mv ~/.config/terminator/config ~/.config/terminator/config.defaults.bak
    cp ~/.dotfiles/init/terminator.config ~/.config/terminator/config

Done.

## License

**MIT License** Copyright (c) 2013 [Mathias Brouilly](http://mathias.brouilly.fr).

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and 
associated documentation files (the "Software"), to deal in the Software without restriction, 
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

> The above copyright notice and this permission notice shall be included in all copies or substantial 
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT 
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
