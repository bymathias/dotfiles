-- Command-line fuzzy finder with Neovim
-- https://github.com/ibhagwan/fzf-lua

return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    {
      '<leader>ff',
      function() require('fzf-lua').files() end,
      desc = '[F]ind [F]iles in Current Working Directory'
    },
    {
      '<leader>fg',
      function() require('fzf-lua').live_grep() end,
      desc = '[F]ind [G]rep in Current Working Directory'
    },
    {
      '<leader>fb',
      function() require('fzf-lua').builtin() end,
      desc = '[F]ind [B]uiltin fzf-lua Commands'
    }
  }
}
