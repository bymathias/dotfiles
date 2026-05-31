-- lua/plugins/mini.lua

local icons = plug("mini", "mini.icons")
if not icons then return end

icons.setup()
-- Intercepts nvim-web-devicons calls so neo-tree and fzf-lua get icons
-- without needing the nvim-web-devicons plugin installed
icons.mock_nvim_web_devicons()

-- All remaining modules share the same pack — plain require() is safe here
local statusline = require("mini.statusline")
statusline.setup({ use_icons = true })

local surround = require("mini.surround")
surround.setup()

local pairs = require("mini.pairs")
pairs.setup()
