# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal dotfiles for an Arch Linux / Sway WM setup. All files in the repo root and `config/` subdirectories are symlinked into `$HOME` by `bootstrap.sh`.

## Bootstrap / installation

```sh
./bootstrap.sh
```

This script symlinks everything: dotfiles at repo root (`.*`) go to `$HOME/.*`, `tmux/` → `~/.tmux`, and each `config/<app>/` → `~/.config/<app>`. Existing files are backed up as `<file>.<date>.backup` before being replaced. It also downloads Catppuccin themes for Alacritty and Btop if those tools are present.

To re-run after adding new files, just re-run `bootstrap.sh` — it handles existing symlinks cleanly.

## Repository layout

| Path | Purpose |
|------|---------|
| `.bashrc` / `.bash_profile` | Shell entry points; source files from `bash/` |
| `bash/*.bash` | Modular bash config: `config`, `prompt`, `paths`, `aliases`, `functions`, `completions` |
| `bin/` | Personal scripts added to `$PATH` via `bash/paths.bash` |
| `config/nvim/` | Neovim config — see `config/nvim/CLAUDE.md` for full architecture |
| `config/sway/` | Sway WM config |
| `config/waybar/` | Waybar (status bar) config + scripts |
| `config/alacritty/` | Alacritty terminal config + Catppuccin themes |
| `config/foot/` | Foot terminal config |
| `config/rofi/` | Rofi launcher config + theme |
| `config/mako/` | Mako notification daemon config |
| `config/btop/` | Btop resource monitor config + themes |
| `tmux/` | Tmux config; plugins managed by TPM in `tmux/plugins/` |
| `git/` | Global gitignore and commit message template |

## Bash config load order

`.bashrc` sources `bash/*.bash` in this order: `config` → `prompt` → `paths` → `aliases` → `functions` → `completions`. Adding a new bash module means sourcing it explicitly in `.bashrc`.

## Neovim (`config/nvim/`)

Uses `vim.pack` — Neovim 0.12's native package manager. No lazy.nvim, packer, or rocks.nvim. Requires Neovim ≥ 0.12.

There is no build step. To test changes, restart Neovim or `:source %` on the changed file. For LSP changes, `:LspRestart` after sourcing. Mason auto-installs missing packages on startup; trigger manually with `:Mason` → `i` on a package.

Format Lua with `stylua` (installed via Mason). No project-level config file — stylua uses its defaults.

### Load order (`init.lua` is strict)

```
config.global      → leader key + netrw disable (must be first)
config.options     → vim.o / vim.opt settings
config.helpers     → defines _G.keymap and _G.plug (available everywhere after this)
config.keymaps     → base keymaps, no plugin deps
config.autocommands → base autocommands, no plugin deps
packs              → vim.pack.add() then loads themes/, then plugins/
```

Plugin configs in `lua/plugins/` and `lua/themes/` run after `vim.pack.add()` so all packs are on `runtimepath`.

### Two global helpers (`lua/config/helpers.lua`)

`_G.plug(pack_name, mod_name?)` — guards require with a `vim.pack.get()` active-check before calling `pcall(require, ...)`. Every plugin config file starts with this guard and returns early if nil.

`_G.keymap.{n,v,i}(key, fn, desc, bufnr?)` — thin wrapper around `vim.keymap.set`. The optional `bufnr` arg scopes the map to a buffer; used in `LspAttach` for buffer-local LSP keymaps.

### LSP (`lua/plugins/lsp/`)

Uses Neovim 0.12 native LSP — `vim.lsp.config[name]` + `vim.lsp.enable()`. No nvim-lspconfig.

- `packages.lua` — Mason package names to auto-install
- `servers.lua` — `vim.lsp.config[...]` definitions (one block per server)
- `init.lua` — Mason setup, diagnostic config, `LspAttach` autocmd (all buffer-local keymaps), then `require("plugins.lsp.servers")`

To add a server: add the Mason package name to `packages.lua`, add the `vim.lsp.config[...]` block to `servers.lua`, add the server name to the `vim.lsp.enable({...})` call at the bottom of `servers.lua`.

`rust_analyzer` is intentionally not in `packages.lua` — install via `rustup component add rust-analyzer` to stay in sync with the active toolchain.

### Plugin keymaps

Base keymaps (no plugin deps) live in `lua/config/keymaps.lua`. Plugin-specific keymaps are defined at the bottom of each plugin's config file (e.g., fzf pickers in `lua/plugins/fzf-lua.lua`, neo-tree toggle in `lua/plugins/neo-tree.lua`, LSP maps inside the `LspAttach` callback).

### Lock file

`nvim-pack-lock.json` is managed by `vim.pack` — do not edit manually.

## Tmux

Plugin manager: TPM (`tmux/plugins/tpm`). Install plugins on first launch with `prefix + I` (`prefix` = `Ctrl+a`). Reload config with `prefix + r`.
