-- lua/core/lazy.lua

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

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
    require 'plugins.vim-sleuth',
    require 'plugins.nvim-treesitter',
    require 'plugins.neo-tree',
    require 'plugins.mini-statusline',
    require 'plugins.which-key',
    require 'plugins.fzf',

    require 'plugins.mason',
    require 'plugins.mason-lspconfig',
    require 'plugins.lspconfig'

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
