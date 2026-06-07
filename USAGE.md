# Usage Reference

## Contents

- [Bash](#bash)
  - [Aliases](#aliases)
  - [Functions](#functions)
- [Tmux](#tmux)
  - [Key bindings](#key-bindings)
  - [Plugins](#tmux-plugins)
- [Neovim](#neovim)
  - [Plugins](#plugins)
  - [Keymaps](#keymaps)
- [Sway](#sway)
  - [Basics](#basics)
  - [Focus & windows](#focus--windows)
  - [Workspaces](#workspaces)
  - [Layout](#layout)
  - [Scratchpad](#scratchpad)
  - [Resize mode](#resize-mode)
  - [Media keys](#media-keys)

---

## Bash

### Aliases

| Alias      | Expands to                                                  |
| ---------- | ----------------------------------------------------------- |
| `..` / `...` / `....` | `cd` up 1 / 2 / 3 levels                      |
| `ll`       | `ls -alF`                                                   |
| `ld`       | List directories only                                       |
| `e`        | `nvim`                                                      |
| `o`        | `thunar &`                                                  |
| `serve`    | `python -m http.server 8080`                                |
| `wttr`     | Terminal weather (`curl wttr.in`)                           |
| `ip`       | Public IP address                                           |
| `now`      | Current date/time (`DD-MM-YYYY HH:MM:SS`)                   |
| `week`     | Current ISO week number                                     |
| `reload`   | Re-source `~/.bash_profile`                                 |
| `path`     | Print `$PATH` entries one per line                          |
| `fa`       | Search aliases — `fa <pattern>`                             |
| `tx`       | Attach existing tmux session or create one named `$USER`    |
| `tn` / `ta` / `tl` / `tk` | tmux new / attach / list / kill-server     |
| `gaa`      | `git add .`                                                 |
| `gcm`      | `git commit -m`                                             |
| `gcma`     | `git commit -a -m`                                          |
| `gnope`    | `git checkout .` — discard all changes                      |
| `gwait`    | `git reset HEAD` — unstage everything                       |
| `gundo`    | `git reset --soft HEAD^` — undo last commit, keep staged    |
| `glog`     | `git log --graph --oneline --decorate --all`                |
| `gck`      | `git checkout`                                              |
| `gph`      | `git push`                                                  |
| `gpl`      | `git pull --rebase`                                         |
| `grb`      | `git rebase`                                                |

### Functions

| Function     | Usage                    | Description                                      |
| ------------ | ------------------------ | ------------------------------------------------ |
| `cdl`        | `cdl <dir>`              | `cd` into directory then `ls -al`                |
| `mkc`        | `mkc <dir>`              | `mkdir -p` then `cd` into new directory          |
| `cpp`        | `cpp <src> <dst>`        | Copy with progress via `rsync`                   |
| `new-script` | `new-script <file>`      | Create executable bash script and open in editor |
| `new-note`   | `new-note <name>`        | Create `~/Dropbox/sync/note/<name>.md`           |
| `list_todo`  | `list_todo [dir]`        | Grep for `TODO:` recursively, excluding `node_modules` |
| `man`        | `man <cmd>`              | Colourised man pages via `LESS_TERMCAP_*`        |
| `explain`    | `explain '<cmd>'`        | Explain a shell command via mankier.com API; omit arg for interactive mode |

---

## Tmux

Prefix: `Ctrl+a`

### Key bindings

| Key                   | Action                                      |
| --------------------- | ------------------------------------------- |
| `prefix r`            | Reload `~/.tmux.conf`                       |
| `prefix c`            | New window (current directory)              |
| `prefix "`            | Split horizontally (current directory)      |
| `prefix %`            | Split vertically (current directory)        |
| `prefix h/j/k/l`      | Move focus between panes                    |
| `prefix S-Left`       | Swap window left                            |
| `prefix S-Right`      | Swap window right                           |
| `prefix I`            | Install TPM plugins (first launch)          |

#### Copy mode (vi)

Enter copy mode with `prefix [`. Standard vi motions apply.

| Key | Action                                 |
| --- | -------------------------------------- |
| `y` | Copy selection to Wayland clipboard    |

### Plugins {#tmux-plugins}

#### TPM — Plugin Manager

| Key              | Action                  |
| ---------------- | ----------------------- |
| `prefix I`       | Install listed plugins  |
| `prefix U`       | Update all plugins      |
| `prefix alt+u`   | Remove unlisted plugins |

#### tmux-resurrect — Manual session save/restore

| Key              | Action           |
| ---------------- | ---------------- |
| `prefix Ctrl+s`  | Save session     |
| `prefix Ctrl+r`  | Restore session  |

#### tmux-continuum

Automatically saves the session every 15 minutes. No key bindings — works in the background.

---

## Neovim

Leader key: `,`

---

## Plugins

### UI

| Plugin                 | Role                                                                        |
| ---------------------- | --------------------------------------------------------------------------- |
| `catppuccin`           | Colorscheme — dark (mocha) / light (latte), toggled with `<leader>tb`, persisted across sessions |
| `mini.statusline`      | Statusline                                                                  |
| `mini.icons`           | File icons (mocks nvim-web-devicons for other plugins)                      |
| `render-markdown.nvim` | In-buffer markdown rendering — active in normal/command mode, raw in insert |

### Navigation & Search

| Plugin          | Role                                                 |
| --------------- | ---------------------------------------------------- |
| `neo-tree.nvim` | File explorer (stays open when last window)          |
| `fzf-lua`       | Fuzzy finder for files, grep, buffers, LSP, and more |

### Editing

| Plugin               | Role                                               |
| -------------------- | -------------------------------------------------- |
| `nvim-treesitter`    | Syntax highlighting and indentation                |
| `nvim-ts-autotag`    | Auto-close and rename HTML/JSX tags                |
| `mini.pairs`         | Auto-close brackets and quotes                     |
| `mini.surround`      | Add, delete, replace surroundings                  |
| `vim-sleuth`         | Auto-detect indentation per buffer                 |
| `todo-comments.nvim` | Highlight and search `TODO`, `FIXME`, `NOTE`, etc. |

### LSP & Completion

| Plugin       | Role                                                     |
| ------------ | -------------------------------------------------------- |
| `mason.nvim` | Package manager for LSP servers, formatters, and linters |
| `blink.cmp`  | Completion engine                                        |

#### LSP servers

| Server          | Language                                                |
| --------------- | ------------------------------------------------------- |
| `lua_ls`        | Lua                                                     |
| `bashls`        | Bash / sh (uses shellcheck for diagnostics)             |
| `ts_ls`         | JavaScript, TypeScript, JSX, TSX                        |
| `jsonls`        | JSON, JSONC                                             |
| `pyright`       | Python                                                  |
| `cssls`         | CSS, SCSS, Less                                         |
| `html`          | HTML                                                    |
| `yamlls`        | YAML                                                    |
| `marksman`      | Markdown                                                |
| `rust_analyzer` | Rust (install via `rustup component add rust-analyzer`) |

### Formatting (conform.nvim)

| Formatter     | Language                                | Installed via |
| ------------- | --------------------------------------- | ------------- |
| `stylua`      | Lua                                     | Mason         |
| `shfmt`       | Bash / sh                               | Mason         |
| `prettier`    | JS, TS, JSON, CSS, HTML, YAML, Markdown | Mason         |
| `ruff_format` | Python                                  | Mason         |
| `rustfmt`     | Rust                                    | rustup        |

### Linting (nvim-lint)

| Linter              | Language                                       | Installed via |
| ------------------- | ---------------------------------------------- | ------------- |
| `shellcheck`        | Bash / sh                                      | Mason         |
| `eslint`            | JS, TS, JSX, TSX (only when config file found) | Mason         |
| `ruff`              | Python                                         | Mason         |
| `yamllint`          | YAML                                           | Mason         |
| `markdownlint-cli2` | Markdown                                       | Mason         |

### Git

| Plugin          | Role                                        |
| --------------- | ------------------------------------------- |
| `gitsigns.nvim` | Inline diff indicators, hunk staging, blame |

---

## Keymaps

### File

| Key          | Action        |
| ------------ | ------------- |
| `<leader>w`  | Save buffer   |
| `<leader>q`  | Quit window   |
| `<leader>wq` | Save and quit |

### Windows

| Key              | Action                    |
| ---------------- | ------------------------- |
| `<C-h/j/k/l>`    | Move focus between splits |
| `<leader>sv`     | Split vertically          |
| `<leader>sh`     | Split horizontally        |
| `<leader>se`     | Equalise split sizes      |
| `<C-Up/Down>`    | Resize height             |
| `<C-Left/Right>` | Resize width              |

### Editing

| Key         | Action                  |
| ----------- | ----------------------- |
| `<Esc>`     | Clear search highlights |
| `<leader>D` | Delete without yanking  |

### Surround (mini.surround)

| Key                | Action              |
| ------------------ | ------------------- |
| `sa{motion}{char}` | Add surrounding     |
| `sd{char}`         | Delete surrounding  |
| `sr{old}{new}`     | Replace surrounding |

### Misc

| Key          | Action        |
| ------------ | ------------- |
| `<leader>tt` | Open terminal |
| `<leader>tb` | Toggle dark/light theme |

### Git (gitsigns, buffer-local)

| Key          | Action        |
| ------------ | ------------- |
| `]h`         | Next hunk     |
| `[h`         | Previous hunk |
| `<leader>hs` | Stage hunk    |
| `<leader>hr` | Reset hunk    |
| `<leader>hb` | Blame line    |
| `<leader>hp` | Preview hunk  |

### Explorer (Neo-tree)

| Key         | Action               |
| ----------- | -------------------- |
| `<leader>e` | Toggle file explorer |

### Find (fzf-lua)

| Key          | Action            |
| ------------ | ----------------- |
| `<leader>ff` | Find files        |
| `<leader>fg` | Live grep         |
| `<leader>fb` | Find buffers      |
| `<leader>fh` | Find help tags    |
| `<leader>fr` | Find recent files |
| `<leader>fc` | Find commands     |
| `<leader>fd` | Find diagnostics  |
| `<leader>fk` | Find keymaps      |
| `<leader>ft` | Find todos        |

### LSP (buffer-local, active when LSP attaches)

Uses fzf-lua pickers when available, falls back to native `vim.lsp.buf` otherwise.

| Key          | Action               |
| ------------ | -------------------- |
| `gd`         | Go to definition     |
| `gD`         | Go to declaration    |
| `gr`         | Go to references     |
| `gi`         | Go to implementation |
| `K`          | Hover documentation  |
| `<leader>rn` | Rename symbol        |
| `<leader>ca` | Code action          |
| `[d`         | Previous diagnostic  |
| `]d`         | Next diagnostic      |

### Todo comments

| Key  | Action        |
| ---- | ------------- |
| `]t` | Next todo     |
| `[t` | Previous todo |

### Formatting (conform.nvim)

| Key          | Action        |
| ------------ | ------------- |
| `<leader>cf` | Format buffer |

---

## Sway

Modifier: `Super` (Mod4). Direction keys follow vim home row: `h` left, `j` down, `k` up, `l` right.

### Basics

| Key | Action |
| --- | --- |
| `Super+Return` | Open terminal (alacritty) |
| `Super+Shift+q` | Kill focused window |
| `Super+Space` | App launcher (rofi) |
| `Super+Shift+c` | Reload config |
| `Super+Shift+e` | Exit Sway |

### Focus & windows

| Key | Action |
| --- | --- |
| `Super+h/j/k/l` | Move focus |
| `Super+Shift+h/j/k/l` | Move focused window |
| `Super+Shift+Arrow` | Move focused window (arrow keys) |
| `Super+Shift+Space` | Toggle floating |
| `Super+d` | Toggle focus tiling / floating |
| `Super+a` | Focus parent container |

### Workspaces

| Key | Action |
| --- | --- |
| `Super+1–0` | Switch to workspace 1–10 |
| `Super+Shift+1–0` | Move window to workspace 1–10 |
| `Super+Left/Right` | Previous / next workspace |

### Layout

| Key | Action |
| --- | --- |
| `Super+b` | Split horizontally |
| `Super+v` | Split vertically |
| `Super+s` | Stacking layout |
| `Super+w` | Tabbed layout |
| `Super+e` | Toggle split layout |
| `Super+f` | Fullscreen |

### Scratchpad

| Key | Action |
| --- | --- |
| `Super+Shift+/` | Send window to scratchpad |
| `Super+/` | Show / cycle scratchpad |
| `Super+Shift+\` | Pull window back to current workspace |

### Resize mode

Enter with `Super+r`, exit with `Enter` or `Escape`.

| Key | Action |
| --- | --- |
| `h/j/k/l` / Arrow keys | Shrink / grow width or height by 10px |

### Media keys

| Key | Action |
| --- | --- |
| `Mute` | Toggle speaker mute |
| `Volume Down` | Volume −5% |
| `Volume Up` | Volume +5% |
| `Mic Mute` | Toggle microphone mute |
| `Brightness Down` | Brightness −5% |
| `Brightness Up` | Brightness +5% |
| `Print Screen` | Screenshot a selection → `~/Images/Screenshots/` |
