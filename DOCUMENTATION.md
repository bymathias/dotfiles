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

| key            | mode        | action               |
| ------         | ----------- | ------               |
| `<leader>` `n` | Normal      | Toggle NERDTree pane |
| ...            |             |                      |

## Tmux

`<prefix>` key => `Ctrl` `a`

| key            | action                               |
| ------         | ------                               |
| `<prefix>` `?` | Display a list of keyboard shortcuts |
| ...            |                                      |
