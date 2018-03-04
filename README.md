# [Mathias's dotfiles](https://github.com/bymathias/dotfiles)

[![Build Status][travis-ci-img]][travis-ci]
[![Commitizen Friendly][commitizen-cli-img]][commitizen-cli]

Config files to setup a system (debian) the way I want it, hopefully useful also for others.

> *Design Principles*
> - Focused on simplicity, speed and portability
> - Defensive checks, so that it will work in most cases
> - Mostly oriented to web development tasks

## Requirements

- [bash4](https://www.gnu.org/software/bash/)
- [curl](curl-url), [wget](wget-url) or [git](git-url) to download the files

(optional) to enable all features, see `init/default.sh`

## Installation

To get up and running on a new system, run the following one-liner..
```bash
bash <(curl -fsSL https://git.io/v1v4m || wget -O - https://git.io/v1v4m) install
```
And reload the shell configuration
```bash
source ~/.bash_profile
```
Et voil&agrave;.

## Usage

Work in progress..

## Change Log

All notable changes to this project will be documented in the [CHANGELOG](CHANGELOG.md).

## Credits

Many thanks to the [dotfiles community][dotfiles-community].

## License

The code is available under the MIT [LICENSE](LICENSE.txt).


<!-- Links -->

[travis-ci]: https://travis-ci.org/bymathias/dotfiles
[travis-ci-img]: http://img.shields.io/travis/bymathias/dotfiles.svg?style=flat-square

[commitizen-cli]: http://commitizen.github.io/cz-cli
[commitizen-cli-img]: https://img.shields.io/badge/commitizen-friendly-brightgreen.svg?style=flat-square

[curl-url]: https://curl.haxx.se
[wget-url]: https://www.gnu.org/software/wget
[git-url]: https://git-scm.com

[dotfiles-community]: http://dotfiles.github.io
