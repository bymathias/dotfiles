-- init.lua
-- Maintainer: Mathias Brouilly
-- Repository: github.com/bymathias/dotfiles
-- License: MIT

-- Files are loaded in strict order; each layer depends on the previous one.

require("config.global")       -- leader key + netrw disable (must be first)
require("config.options")
require("config.helpers")
require("config.keymaps")
require("config.autocommands")
require("packs")
