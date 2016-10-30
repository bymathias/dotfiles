# Mathias's [dotfiles](https://github.com/bymathias/dotfiles)

> Config files to setup a system (debian/osx) the way I want it.

### Requirements

```sh
# required: build-essential libssl-dev curl git

# Install ruby using rvm
curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.bash_profile
rvm install 2.1.1
rvm use 2.1.1 --default
# macos: install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install utilities
# macos
brew install vim --with-override-system-vi reattach-to-user-namespace tmux ctags
# debian
sudo apt-get install vim-nox xclip xdg-utils tmux exuberant-ctags

# Install node.js using nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
source ~/.bash_profile
nvm install 6.9.1
nvm alias default 6.9.1

# Vim, npm packages required
npm install -g csscomb instant-markdown-d
```

### Installation

```sh
# Clone the repository
git clone https://bymathias@github.com/bymathias/dotfiles.git ~/.dotfiles
cd .dotfiles

# Install the .dotfiles
./bootstrap.sh install
# ./bootstrap.sh [ install | uninstall ]

# Edit the git config
git config --global user.name "[YOUR_NAME]"
git config --global user.email [YOUR_EMAIL]
git config --global github.user "[GITHUB_USERNAME]"

# Install Vim plugins
vim +PlugInstall +qall
```

### License

Licensed under the [MIT License](https://github.com/bymathias/dotfiles/blob/master/LICENSE.md).
