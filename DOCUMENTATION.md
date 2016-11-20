work in progress..

# Mathias's [dotfiles](https://github.com/bymathias/dotfiles)

> Config files to setup a system (macOS/Debian) the way I want it.

#### Table of contents

- [Requirements]()
- [Installation]()
- [Usage]()
- [Changelog]()
- [License]()

[![Build Status](http://img.shields.io/travis/bymathias/dotfiles.svg?style=flat-square)](https://travis-ci.org/bymathias/dotfiles) <sup>Tested on **macOS _Sierra_**  and **Debian _Jessie_**</sup>

## Requirements

- [git](https://git-scm.com/)
- [curl](https://curl.haxx.se/)
- macos: [XCode]()


- Install/manage Ruby version using rvm
```sh
curl -L https://get.rvm.io | bash -s stable
# list known rubies
rvm list known
# install a version of Ruby
rvm install 2.3.0
# use the newly installed Ruby
rvm use 2.3.0
# optional: Set a version of Ruby to use as the default for new shells
rvm use 2.3.0 --default
# check this worked correctly
ruby -v
which ruby
```
- macos: Install [Homebrew]() package manager
```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# check this worked correctly
brew doctor
brew -v
which brew
```
- Install/manage node.js version using nvm
```sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
# list available node.js versions
nvm ls-remote
# install a version of node.js
nvm install 4.5.0
# use the newly installed node.js
nvm use 4.5.0
# check this worked correctly
node -v
which node
```
## Installation

- Clone the repository and enter it
```sh
git clone https://bymathias@github.com/bymathias/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```
- Symlink/install the dotfiles and reload the config
```sh
./bootstrap install
source ~/.bash_profile
```
- Upgrade/install required dependencies and useful tools
```sh
# [macos]
./init/brew.sh

# [debian]
./init/debian.sh
```
- Install [npm]() packages required globally
```sh
./init/npm-g.sh
```
- Terminal setup: [iTerm2]() and [Terminator]()
```sh
# [macos]
brew cask install iterm2
open ~/.dotfiles/term/iTerm/default.itermcolors

# [debian]
sudo apt-get install terminator
mv ~/.config/terminator/config ~/.config/terminator/config-default.bak
ln -sv ~/.dotfiles/term/terminator/default.config ~/.config/terminator/config
```
## Usage

- `bash/` aliases
```sh
# List aliases
alias
```
- `bash/` functions

...

- `bin/` scripts

```sh
# Creates 'license.txt' MIT file in PWD
license-mit

# Unpack archive
# File supported: .tar.bz2 .tar.gz .tar .tbz2 .tgz .rar .bz2 .gz .zip .Z .7z
unpack <file>

# Markdown.pl
# ref: http://daringfireball.net/projects/markdown
# alias markdown-to-html='perl ~/.dotfiles/bin/Markdown.pl --html4tags'
markdown-to-html <input> > <output>

# Nu Html Checker
# ref: https://validator.github.io/validator
# alias nu-html-checker='java -jar ~/.dotfiles/bin/vnu.jar'
nu-html-checker --help

# SpeedTest Cli
# ref: https://github.com/sivel/speedtest-cl://github.com/sivel/speedtest-cli
# alias speedtest-cli
speedtest-cli --help

# Rsync Time Backup
# ref: https://github.com/laurent22/rsync-time-backup
# alias rsync-time-backup
rsync-time-backup --help
```
- `vim/` setup

| key            | mode        | action               |
| ------         | ----------- | ------               |
| `,`            | Normal      | Set `<leader>` key   |
| `<leader>` `n` | Normal      | Toggle Nerdtree pane |
| ...            |             |                      |

- `tmux/` setup

| key        | action             |
| ------     | ------             |
| `Ctrl` `a` | Set `<prefix>` key |
| ...        |                    |

## Extras

- Install common desktop applications
```sh
cd .dotfiles

# macos
./init/brew-cask.sh

# debian
./init/debian-desk.sh
```
- Install [Nginx]() from source, locally for development


## Changelog

## License

The code is available under the [MIT License](https://github.com/bymathias/dotfiles/blob/master/LICENSE.txt).
