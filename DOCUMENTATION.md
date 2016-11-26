> work in progress..

# [.dotfiles]()'s documentation

An attempt to summarize the process to setup my own development environment.

##### Design principles:

- Support for _macOS Sierra_ and _Debian Jessie_
- Focused on simplicity, speed and portability
- Defensive checks, so that it will work in most cases
- Mostly oriented to web development tasks

##### Table of Contents

- [Requirements]()
    - [Prerequisites]()
    - [Install/upgrade common libraries]()
- [Installation]()
    - [Install/symlink the .dotfiles]()
    - [Install dependencies and useful tools]()
	- [Terminal setup]()
- [Usages]()
    - [Bash]()
    - [Bin]()
    - [Tmux]()
    - [Vim]()
- [Extras]()
    - [Local LEMP]()
    - [Desktop Applications]()
	- [Miscs]()

---

## Requirements

### Prerequisites

__macos__

- Install [XCode]() through the App Store
- Install [XCode Command Line Tools](), open the Terminal and run
```sh
xcode-select --install
```
__debian__

- Edit the source.list file and add
- Update/upgrade your system
- Install the following libraries through `apt-get`
```sh
sudo apt-get install build-essential libssl-dev
```
### Install/upgrade common libraries

- Manage [Ruby]() version using [rvm]()
```sh
# install rvm, one-liner
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
- __macos__: Install [Homebrew]() package manager
```sh
# install Homebrew, one-liner
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# check this worked correctly
brew doctor
brew -v
which brew
```
- Install/manage [node.js]() version using [nvm]()
```sh
# install nvm, one-liner
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

### Install/symlink the .dotfiles

Clone the repository and run the install script, one-liner
```sh
curl -fsSL https://git.io/v1v4m | bash -s install
```
or the manual way
```sh
# clone the repository and enter it
git clone https://github.com/bymathias/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# run the install script
./bootstrap.sh install
```
Reload the config
```sh
source ~/.bash_profile
```
### Install dependencies and useful tools

Install packages via `brew` or `apt-get`
```sh
# macos
sh ~/.dotfiles/init/brew.sh

# debian
sh ~/.dotfiles/init/debian.sh
```
Install [npm]() packages required globally
```sh
sh ~/.dotfiles/init/npm-global
```
### Terminal setup
```sh
# macos
brew cask install iterm2
open ~/.dotfiles/term/iTerm/default.itermcolors

# debian
sudo apt-get install terminator
mv ~/.config/terminator/config ~/.config/terminator/config-default.bak
ln -sv ~/.dotfiles/term/terminator/default.config ~/.config/terminator/config
```
## Usage

...
