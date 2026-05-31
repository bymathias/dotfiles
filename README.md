# [Mathias's dotfiles][dotfiles]

> Config files to setup a system the way I want, hopefully useful also for others.

## Requirements

See [REQUIREMENTS.md](REQUIREMENTS.md).

## Installation

```sh
git clone https://github.com/bymathias/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
```

Symlinks all dotfiles into `$HOME`. Re-run at any time to pick up new files — existing files are backed up as `<file>.<date>.backup`.

## Usage

See [USAGE.md](USAGE.md).

## License

The code is available under the [MIT LICENSE](LICENSE.txt).

## CI

[![ShellCheck](https://github.com/bymathias/dotfiles/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/bymathias/dotfiles/actions/workflows/shellcheck.yml)
[![LuaCheck](https://github.com/bymathias/dotfiles/actions/workflows/luacheck.yml/badge.svg)](https://github.com/bymathias/dotfiles/actions/workflows/luacheck.yml)
[![Gitleaks](https://github.com/bymathias/dotfiles/actions/workflows/gitleaks.yml/badge.svg)](https://github.com/bymathias/dotfiles/actions/workflows/gitleaks.yml)

<!-- Links -->

[dotfiles]: https://github.com/bymathias/dotfiles
