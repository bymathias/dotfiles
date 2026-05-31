-- lua/plugins/treesitter.lua

local treesitter = plug("nvim-treesitter")
if not treesitter then return end

treesitter.setup({
  -- Parsers to auto-install on first launch (requires gcc/clang on $PATH)
  ensure_installed = {
    "lua", "vim", "vimdoc",
    "bash",
    "javascript", "typescript", "tsx", "json", "jsonc",
    "python",
    "rust",
    "css", "html",
    "yaml",
    "markdown", "markdown_inline",
  },
  highlight = { enable = true },
  indent = { enable = true },
})
