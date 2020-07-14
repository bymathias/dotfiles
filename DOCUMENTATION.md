> Work in progress..

__Table of contents__

- [bootstrap.sh](#bootstrap.sh)
- [Bash](#bash)
- [Bin](#bin)
- [Vim](#vim)
- [Tmux](#tmux)

## Bootstrap

Display the help message
```bash
./bootstrap.sh help
# or
./bootstrap.sh
```
Update Vim and Tmux plugins
```bash
./bootstrap.sh update
```
Release .dotfiles version
```bash
./bootstrap.sh release
# It will prompt you to submit a new version..
# Create and commit the changelog file automatically..
# And add the new git tag
```

## Bash

### Aliases

| alias  | action                                          |
| ------ | ------                                          |
| `..`   | Go up 1 directory level                         |
| `...`  | Go up 2 directory level                         |
| `....` | Go up 3 directory level                         |
| `l`    | `ls` with `--classify`                          |
| `ll`   | `ls` with `-l --all --classify`                 |
| `o`    | Open current directory in file manager (thunar) |
| `gc`   | Git commit                                      |
| ...    |                                                 |

### Functions

| function | argument(s) | action                           |
| ------   | ------      | ------                           |
| `cdl`    | none        | Changes directory and list files |
| ...      |             |                                  |

## Bin

...

## Vim

`<leader>` key => `,`

| key                | mode        | action                                             |
| ------             | ----------- | ------                                             |
| `<leader>` + `n`   | Normal      | `NERDTree` toggle pane                             |
| `<leader>` + `fn`  | Normal      | `NERDTree` focus/highlight toggle the current file |
| `<leader>` + `cn`  | Normal      | `NERDTree` open directory of the current file      |
|                    |             |                                                    |
| `<Tab>`            | Insert      | `Ultisnips` expand snippets                        |
| `<Tab>`            | Insert      | `Ultisnips` jump forward, next placeholder         |
| `b` + `<Tab>`      | Insert      | `Ultisnips` jump backward, previous placeholder    |
| `Ctrl` + `l`       | Insert      | `Ultisnips` list snippets                          |
|                    |             |                                                    |
| `Ctrl` + `<space>` | Insert      | `Emmet-vim` expand abbreviation                    |
| ...                |             |                                                    |

## Tmux

`<prefix>` key => `Ctrl` `a`

| key            | action                               |
| ------         | ------                               |
| `<prefix>` `?` | Display a list of keyboard shortcuts |
| `<prefix> Ctrl + s` | Saves all the working directories, pane layouts, etc.., from your tmux environment |
| `<prefix> Ctrl + r` | Restores your tmux environment setup |
| ...            |                                      |

Tmux environment will be saved at the interval of 15 minutes, using [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)

