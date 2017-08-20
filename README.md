# Mathias's [dotfiles](https://github.com/bymathias/dotfiles)

[![Build Status](http://img.shields.io/travis/bymathias/dotfiles.svg?style=flat-square)](https://travis-ci.org/bymathias/dotfiles) [![Commitizen Friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg?style=flat-square)](http://commitizen.github.io/cz-cli/)
> Config files to setup a system (linux/macos) the way I want it, hopefully useful also for others.

## Requirements

- [curl](https://curl.haxx.se/) or [wget](https://www.gnu.org/software/wget/)
- [vim](http://www.vim.org/)

## Installation

Run the `bootstrap.sh` script with the following one-liner.
```sh
curl -fsSL https://git.io/v1v4m | bash -s install
# or
wget -O - https://git.io/v1v4m | bash -s install
```
Or manually, clone the repository with [git](https://git-scm.com/) and run the `bootstrap.sh` script.
```sh
git clone https://github.com/bymathias/dotfiles.git ~/.dotfiles

cd ~/.dotfiles
./bootstrap.sh install
```
Then reload the shell configuration.. `source ~/.bash_profile`, done.

## Change Log

All notable changes to this project will be documented in the [CHANGELOG](https://github.com/bymathias/dotfiles/blob/master/CHANGELOG.md).

## Contributing

If you want to help, please read the [CONTRIBUTING](https://github.com/bymathias/dotfiles/blob/master/CONTRIBUTING.md) guide first.

## Credits

Many thanks to the [dotfiles community](http://dotfiles.github.io/).

## License

The code is available under the MIT [LICENSE](https://github.com/bymathias/dotfiles/blob/master/LICENSE.txt).
