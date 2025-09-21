-- Catppuccin theme
-- https://github.com/catppuccin/nvim

return {
  {
    'catppuccin/nvim',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha', -- auto, latte, frappe, macchiato, mocha
      })

      -- setup must be called before loading
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
