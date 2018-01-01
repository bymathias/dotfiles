[![Build Status](http://img.shields.io/travis/bymathias/dotfiles.svg?style=flat-square)](https://travis-ci.org/bymathias/dotfiles) [![Commitizen Friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg?style=flat-square)](http://commitizen.github.io/cz-cli/)
> Config files to setup a system (debian) the way I want it, hopefully useful also for others.

## Requirements

- [curl](https://curl.haxx.se/) or [wget](https://www.gnu.org/software/wget/)

## Quick start

To get up and running on a new system, run the following one-liner
```bash
bash <(i=https://git.io/v1v4m && curl -fsSL $i || wget -O - $i) install
```
then reload the shell configuration
```bash
source ~/.bash_profile
```
Et voil&agrave;.

_(optional)_ To enable all the features, install the dependencies and tools
```bash
# `apt` debian libraries
# `npm` IF node.js is installed
./init/dotfiles.sh

# then re-run bootstrap install
./bootstrap.sh install
```
## Usage

...

## Credits

Many thanks to the [dotfiles community](http://dotfiles.github.io/).

## License

The code is available under the MIT [LICENSE](https://github.com/bymathias/dotfiles/blob/master/LICENSE.txt).
