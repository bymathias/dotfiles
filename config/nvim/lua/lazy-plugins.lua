-- lua/lazy-plugins.lua

-- [[ Configure and install plugins ]]
--  To check the current status of your plugins, run
--    :Lazy
--    :Lazy update

require('lazy').setup({
  spec = {
    -- modular approach: using `require 'path.name'` will
    -- include a theme/plugin definition from file /{theme,plugins}/name.lua

    -- [[ Themes ]]
    require 'themes.catppuccin',

    -- [[ Plugins ]]
    require 'plugins.guess-indent',
    require 'plugins.autopairs',
    require 'plugins.neo-tree',
    require 'plugins.mini-statusline',

  },

  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { 'catppuccin' } },
  -- automatically check for plugin updates
  checker = { enabled = true },

  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
