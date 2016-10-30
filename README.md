# Mathias's [dotfiles](https://github.com/bymathias/dotfiles)

> Config files to setup a system (debian/osx) the way I want it.

### Requirements

```sh
# required:
# - curl
# - git
# - ruby (use: rvm)
# - brew (os: macos)

# macos
brew install \
  tmux \
  vim --with-override-system-vi \
  reattach-to-user-namespace \ # patch for macos pbpaste and pbcopy under tmux
  ctags                        # required by vim 'tagbar' plugin

# debian
sudo apt-get install \
  tmux \
  vim-nox \
  xclip \         # required by vim 'gist-vim' plugin
  xdg-utils \     # required by vim 'vim-instant-markdown' plugin
  exuberant-ctags # required by vim 'tagbar' plugin

# optional:
# - node (use: nvm)

npm install -g \
  csscomb \          # required by vim 'csscomb' plugin
  instant-markdown-d # required by vim 'vim-instant-markdown' plugin
```

### Installation

```sh
git clone https://bymathias@github.com/bymathias/dotfiles.git ~/.dotfiles
cd .dotfiles

./bootstrap.sh install
# ./bootstrap.sh [ install | uninstall ]

git config --global user.name "[YOUR_NAME]"
git config --global user.email [YOUR_EMAIL]
git config --global github.user "[GITHUB_USERNAME]"

vim +PlugInstall +qall
```

### Usage

#### - Local scripts: `/bin`

* [Nu Html Checker](https://validator.github.io/validator/) 
```sh
# alias nu-html-checker='java -jar ~/.dotfiles/bin/vnu.jar'
nu-html-checker --help
```
* [SpeedTest Cli](https://github.com/sivel/speedtest-cl://github.com/sivel/speedtest-cli)
```sh
# alias speedtest-cli
speedtest-cli --help
```

### License

Licensed under the [MIT License](https://github.com/bymathias/dotfiles/blob/master/LICENSE.md).
