# Requirements

## Contents

- [Bash](#bash)
- [Tmux](#tmux)
- [Neovim](#neovim)
  - [System dependencies](#system-dependencies)
  - [Rust (optional)](#rust-optional)
  - [Mason-managed](#mason-managed-auto-installed-on-startup)

---

## Bash

| Tool               | Why                                              |
| ------------------ | ------------------------------------------------ |
| `bash-completion`  | Tab completions — `pacman -S bash-completion`    |
| `nvm`              | Node version management (lazy-loaded on first use) |
| `rsync`            | `cpp` function — copy with progress              |
| `curl`             | `wttr`, `ip`, and `explain`                      |
| `tmux`             | Tmux aliases (`tx`, `tn`, `ta`, `tl`, `tk`)      |
| `thunar`           | `o` alias — graphical file manager               |
| `python3`          | `serve` alias — `python -m http.server`          |

---

## Tmux

Version **≥ 3.2** — required for `set-clipboard on` (OSC 52 support).

| Tool           | Why                                                      |
| -------------- | -------------------------------------------------------- |
| `tmux`         | ≥ 3.2                                                    |
| `wl-clipboard` | `wl-copy` — Wayland clipboard in vi copy mode (`pacman -S wl-clipboard`) |

Plugins are managed by **TPM** (bundled at `tmux/plugins/tpm`). Install on first launch with `prefix + I`. TPM fetches:

| Plugin               | Role                                  |
| -------------------- | ------------------------------------- |
| `catppuccin/tmux`    | Status bar theme (mocha)              |
| `tmux-resurrect`     | Save and restore sessions             |
| `tmux-continuum`     | Automatic session save/restore        |

---

## Neovim

Version **≥ 0.12** — uses `vim.pack` (native package manager).

## System dependencies

Must be installed and on `$PATH` before starting Neovim.

| Tool    | Why                                           |
| ------- | --------------------------------------------- |
| `git`   | Root marker detection, gitsigns, neo-tree     |
| `fzf`   | fzf-lua fuzzy finder backend                  |
| `node`  | Mason-installed LSP servers and tools         |
| `python`| Mason-installed pyright and ruff              |

### Rust (optional)

`rust-analyzer` and `rustfmt` are **not** managed by Mason. Install via rustup:

```sh
rustup component add rust-analyzer rustfmt
```

## Mason-managed (auto-installed on startup)

Mason installs these on first launch. No manual action needed.

### LSP servers

| Package                    | Language                |
| -------------------------- | ----------------------- |
| `lua-language-server`      | Lua                     |
| `bash-language-server`     | Bash / sh               |
| `typescript-language-server` | JS, TS, JSX, TSX      |
| `json-lsp`                 | JSON, JSONC             |
| `pyright`                  | Python                  |
| `css-lsp`                  | CSS, SCSS, Less         |
| `html-lsp`                 | HTML                    |
| `yaml-language-server`     | YAML                    |
| `marksman`                 | Markdown                |

### Formatters

| Package    | Language                                |
| ---------- | --------------------------------------- |
| `stylua`   | Lua                                     |
| `shfmt`    | Bash / sh                               |
| `prettier` | JS, TS, JSON, CSS, HTML, YAML, Markdown |
| `ruff`     | Python                                  |

### Linters

| Package               | Language    |
| --------------------- | ----------- |
| `shellcheck`          | Bash / sh   |
| `eslint`              | JS, TS      |
| `yamllint`            | YAML        |
| `markdownlint-cli2`   | Markdown    |
