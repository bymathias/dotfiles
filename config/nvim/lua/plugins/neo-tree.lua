-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,           -- Show filtered items by default (e.g., gitignored)
        hide_dotfiles = false,    -- Show hidden files (e.g., .gitignore)
        hide_gitignored = false,  -- Still hide .gitignore'd files if desired
        hide_by_name = {          -- Optionally hide specific files regardless
          ".git",
          ".DS_Store",
        },
        -- never_show = {          -- Always hide these
        --   ".git",
        -- },
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
