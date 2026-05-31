-- lua/plugins/lsp/packages.lua

-- Mason package names to auto-install on startup.
-- rust-analyzer and rustfmt are intentionally absent — install via rustup.
return {
  -- Language servers
  "lua-language-server",
  "bash-language-server",
  "typescript-language-server",
  "json-lsp",
  "pyright",
  "css-lsp",
  "html-lsp",
  "yaml-language-server",
  "marksman",
  -- Formatters
  "stylua",
  "shfmt",
  "prettier",
  "ruff",
  -- Linters
  "shellcheck",
  "eslint",
  "yamllint",
  "markdownlint-cli2",
}
