-- Provide a simple and easy way to use the interface for tree-sitter in Neovim
-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
      -- Add languages you need
      ensure_installed = {
        'c',
        'rust',
        'lua',
        'vim',
        'vimdoc',
        'bash',
        'python',
        'javascript',
        'typescript',
        'json',
        'html',
        'xml',
        'css',
        'php',
        'ruby',
        'http',
        'nginx'
      },
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<Enter>',
          node_incremental = '<Enter>',
          scope_incremental = false,
          node_decremental = '<Backspace>',
        },
      },
    })
  end
}
