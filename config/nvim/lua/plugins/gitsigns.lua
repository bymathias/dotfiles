-- lua/plugins/gitsigns.lua

local gitsigns = plug("gitsigns")
if not gitsigns then return end

gitsigns.setup({
  on_attach = function(bufnr)
    keymap.n("]h",         gitsigns.next_hunk,    "Next hunk",    bufnr)
    keymap.n("[h",         gitsigns.prev_hunk,    "Previous hunk", bufnr)
    keymap.n("<leader>hs", gitsigns.stage_hunk,   "Stage hunk",   bufnr)
    keymap.n("<leader>hr", gitsigns.reset_hunk,   "Reset hunk",   bufnr)
    keymap.n("<leader>hb", gitsigns.blame_line,   "Blame line",   bufnr)
    keymap.n("<leader>hp", gitsigns.preview_hunk, "Preview hunk", bufnr)
  end,
})
