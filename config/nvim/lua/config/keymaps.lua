-- lua/config/keymaps.lua

-- Base keymaps with no plugin dependencies.
-- Plugin-specific keymaps live in each plugin's config file.

-- ╭─────────────────────────────────────────╮
-- │ File                                    │
-- ╰─────────────────────────────────────────╯

keymap.n("<leader>w",  "<cmd>w<cr>",  "Save the current buffer")
keymap.n("<leader>q",  "<cmd>q<cr>",  "Quit the current window")
keymap.n("<leader>wq", "<cmd>wq<cr>", "Save and quit the current buffer")

-- ╭─────────────────────────────────────────╮
-- │ Windows                                 │
-- ╰─────────────────────────────────────────╯

keymap.n("<C-h>", "<C-w><C-h>", "Move focus to the left window")
keymap.n("<C-l>", "<C-w><C-l>", "Move focus to the right window")
keymap.n("<C-j>", "<C-w><C-j>", "Move focus to the lower window")
keymap.n("<C-k>", "<C-w><C-k>", "Move focus to the upper window")

keymap.n("<leader>sv", "<cmd>vsplit<cr>", "Split vertically")
keymap.n("<leader>sh", "<cmd>split<cr>",  "Split horizontally")
keymap.n("<leader>se", "<C-w>=",          "Equalise split sizes")

keymap.n("<C-Up>",    "<cmd>resize +2<cr>",          "Increase window height")
keymap.n("<C-Down>",  "<cmd>resize -2<cr>",          "Decrease window height")
keymap.n("<C-Left>",  "<cmd>vertical resize -2<cr>", "Decrease window width")
keymap.n("<C-Right>", "<cmd>vertical resize +2<cr>", "Increase window width")

-- ╭─────────────────────────────────────────╮
-- │ Editing                                 │
-- ╰─────────────────────────────────────────╯

keymap.n("<Esc>", "<cmd>nohlsearch<cr>", "Clear search highlights")
keymap.n("<leader>D", '"_d', "Delete without yanking")

-- ╭─────────────────────────────────────────╮
-- │ Misc                                    │
-- ╰─────────────────────────────────────────╯

keymap.n("<leader>tt", "<cmd>terminal<cr>", "Open terminal")
