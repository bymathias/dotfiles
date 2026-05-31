-- lua/config/autocommands.lua

-- Base autocommands with no plugin dependencies.

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Restore cursor position",
  group = vim.api.nvim_create_augroup("restore-cursor", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Useful when toggling window manager layouts or moving between monitors
vim.api.nvim_create_autocmd("VimResized", {
  desc = "Equalise splits on window resize",
  group = vim.api.nvim_create_augroup("equalise-splits", { clear = true }),
  callback = function()
    vim.cmd.tabdo("wincmd =")
  end,
})
