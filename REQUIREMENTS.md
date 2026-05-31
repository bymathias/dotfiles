# Requirements

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
