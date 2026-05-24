-- init.lua

-- Maintainer: Mathias Brouilly
-- Repository: github.com/bymathias/dotfiles
-- License: MIT

-- [[ Configurations ]]
require 'config.global'

-- [[ Setting options ]]
require 'config.options'

-- [[ Basic Keymaps ]]
require 'config.keymaps'

-- [[ Basic Autocommands ]]
require 'config.autocommands'

-- [[ Bootstrap Lazy.nvim and Install plugins ]]
require 'core.lazy'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
