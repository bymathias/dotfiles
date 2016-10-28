# Mathias's [dotfiles][home-url]

[![MIT License][license-badge]][license-url]
[![Travis Status][travis-badge]][travis-url]

> Config files to setup a system (debian/osx) the way I want it.

### Requirements

[Git][git-url], [Curl][curl-url] and [Vim][vim-url]

### Installation

Clone the repository and install.

```sh
git clone https://bymathias@github.com/bymathias/dotfiles.git ~/.dotfiles
cd .dotfiles

./bootstrap.sh install
# ./bootstrap.sh [ install | uninstall ]
```

Edit the `.gitconfig` [user](https://github.com/bymathias/dotfiles/blob/master/git/.gitconfig#L1) and [github user](https://github.com/bymathias/dotfiles/blob/master/git/.gitconfig#L23) to fit your details. Et voilà.

### License

Licensed under the [MIT License][license-url].

<!-- Link Labels -->

[home-url]: https://github.com/bymathias/dotfiles

[license-badge]: http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square
[license-url]:   https://github.com/bymathias/dotfiles/blob/master/LICENSE.md
[travis-badge]:  http://img.shields.io/travis/bymathias/dotfiles.svg?style=flat-square
[travis-url]:    https://travis-ci.org/bymathias/dotfiles

[git-url]:    http://git-scm.com
[curl-url]:   http://curl.haxx.se
[nodejs-url]: https://nodejs.org
[vim-url]:    http://www.vim.org
