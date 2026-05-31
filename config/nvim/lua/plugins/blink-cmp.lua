-- lua/plugins/blink-cmp.lua

local blink = plug("blink-cmp")
if not blink then return end

-- vim.pack has no build hook; download the native library on first install.
-- Equivalent to lazy.nvim's: build = function() require('blink.cmp').build():wait() end
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    blink.build():wait(30000)
  end,
})

blink.setup({
  keymap = { preset = "default" },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
})
