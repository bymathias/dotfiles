# [Mathias's dotfiles][dotfiles]

![GitHub release](https://img.shields.io/github/release/bymathias/dotfiles.svg?style=flat-square)
![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/bymathias/dotfiles.svg?color=red&style=flat-square)
![Travis (.org)](https://img.shields.io/travis/bymathias/dotfiles.svg?style=flat-square)

> Config files to setup a system (debian) the way I want it, hopefully useful also for others.

# Principles

- Focused on simplicity, speed and portability
- Defensive checks, so that it will work in most cases
- Mostly oriented to web development tasks

## Requirements

- [Bash4][bash4]
- [Git][git]
- *Optional, but strongly recommended:*
    - [Vim](https://www.vim.org/)
    - [Tmux](https://github.com/tmux/tmux)
    - [EditorConfig](https://editorconfig.org/)
    - [Node.js](https://nodejs.org/en/)
    - [Terminator](https://terminator-gtk3.readthedocs.io/en/latest/)

## Installation

To get up and running on a new system, run the following
```bash
# Clone the repository
git clone https://github.com/bymathias/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Run the install script
./bootstrap.sh install

# Reload the shell configuration
source ~/.bash_profile
```
Et voil&agrave;.

## Usage

See the [DOCUMENTATION](DOCUMENTATION.md).

## Change Log

All notable changes to this project will be documented in the [CHANGELOG](CHANGELOG.md).

## Contributing

Feel free to contribute. Pull requests will be automatically checked/linted via [Travis](https://travis-ci.org) with:

- [shellcheck](https://www.shellcheck.net/)
- [vim-vimlint](https://github.com/syngan/vim-vimlint), [vim-vimlparser](https://github.com/ynkdir/vim-vimlparser)

## Credits

Many thanks to the [dotfiles community][dotfiles-community].

## License

The code is available under the MIT [LICENSE](LICENSE.txt).


<!-- Links -->

[dotfiles]: https://github.com/bymathias/dotfiles

[bash4]: https://www.gnu.org/software/bash
[git]: https://git-scm.com

[dotfiles-community]: http://dotfiles.github.io
