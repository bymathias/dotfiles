-- lua/themes/catppuccin.lua

local catppuccin = plug("catppuccin")
if not catppuccin then return end

-- Persist dark/light preference across sessions
local state_file = vim.fn.stdpath("data") .. "/theme_background"
local saved = vim.fn.filereadable(state_file) == 1 and vim.fn.readfile(state_file) or {}
vim.o.background = (saved[1] == "light") and "light" or "dark"

catppuccin.setup({
  flavour = "auto", -- follows vim.o.background: dark→mocha, light→latte
  background = {
    dark  = "mocha",
    light = "latte",
  },
})

vim.opt.termguicolors = true -- required for true-color themes; set here to stay co-located
vim.cmd.colorscheme("catppuccin")

keymap.n("<leader>tb", function()
  vim.o.background = vim.o.background == "dark" and "light" or "dark"
  vim.fn.writefile({ vim.o.background }, state_file)
end, "Toggle dark/light theme")
