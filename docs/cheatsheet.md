# Cheatsheet

> work in progress..

**Table of content**

- [Bash]()
- [Git]()
- [Bin]()
- [Tmux]()
- [Vim]()

---

## Bash

#### Aliases

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

#### Functions

| function | argument(s) | action                           |
| ------   | ------      | ------                           |
| `cdl`    | none        | Changes directory and list files |

## Git

...

## Bin

Creates `license.txt` MIT file in PWD
```sh
license-mit
```
Unpack archive, file supported: .tar.bz2 .tar.gz .tar .tbz2 .tgz .rar .bz2 .gz .zip .Z .7z
```sh
unpack <filename>
```
## Tmux

`<prefix>` key set to `Ctrl a`

| key            | action                               |
| ------         | ------                               |
| `<prefix>` `?` | Display a list of keyboard shortcuts |
| ...            |                                      |

## Vim

`<leader>` key set to `,`

| key            | mode        | action               |
| ------         | ----------- | ------               |
| `<leader>` `n` | Normal      | Toggle Nerdtree pane |
| ...            |             |                      |
