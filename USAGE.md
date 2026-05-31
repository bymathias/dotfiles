# Neovim Config Reference

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
