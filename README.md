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

git config --global user.name "<user>"
git config --global user.email <email>
git config --global github.user "<github-user>"

vim +PlugInstall +qall
```

### Usage

#### - `bash` aliases
```sh
# List aliases
alias
```
#### - `bash` functions

...

#### - `bin` scripts
```sh
# Creates 'license.txt' MIT file in PWD
license-mit

# Unpack archive
# File supported: .tar.bz2 .tar.gz .tar .tbz2 .tgz .rar .bz2 .gz .zip .Z .7z
unpack <file>

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
#### - `vim` setup

| key            | mode        | action               |
| ------         | ----------- | ------               |
| `,`            | Normal      | `<leader>` key       |
| `<leader>` `n` | Normal      | Toggle Nerdtree pane |
| ...            |             |                      |

#### - `tmux` setup

| key        | mode        | action         |
| ------     | ----------- | ------         |
| `Ctrl` `a` | Normal      | `<prefix>` key |
| ...        |             |                |
### License

Licensed under the [MIT License](https://github.com/bymathias/dotfiles/blob/master/LICENSE.md).
