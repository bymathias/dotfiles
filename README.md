# [Mathias's dotfiles][dotfiles]

[![Build Status][travis-ci-img]][travis-ci]

> Config files to setup a system (debian) the way I want it, hopefully useful also for others.

# Principles

- Focused on simplicity, speed and portability (desktop, server)
- Defensive checks, so that it will work in most cases
- Mostly oriented to web development tasks

## Requirements

- [bash4][bash4]
- [git][git]

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

- [Shellcheck](https://www.shellcheck.net/)
- [vim-vimlint](https://github.com/syngan/vim-vimlint) and [vim-vimlparser](https://github.com/ynkdir/vim-vimlparser)

## Credits

Many thanks to the [dotfiles community][dotfiles-community].

## License

The code is available under the MIT [LICENSE](LICENSE.txt).


<!-- Links -->

[dotfiles]: https://github.com/bymathias/dotfiles

[travis-ci]: https://travis-ci.org/bymathias/dotfiles
[travis-ci-img]: http://img.shields.io/travis/bymathias/dotfiles.svg?style=flat-square

[bash4]: https://www.gnu.org/software/bash
[git]: https://git-scm.com

[dotfiles-community]: http://dotfiles.github.io
