-- lua/plugins/neo-tree.lua

local neotree = plug("neo-tree")
if not neotree then return end

neotree.setup({
  close_if_last_window = false,
  window = {
    position = "left",
    width = 30,
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = { ".git", ".DS_Store" },
    },
    follow_current_file = { enabled = true },
  },
})

-- Close neo-tree before quitting so Neovim can exit when it's the last window
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local wins = vim.api.nvim_list_wins()
    local neotree_wins = vim.tbl_filter(function(w)
      return vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w)):match("neo-tree")
    end, wins)
    if #neotree_wins == #wins then
      for _, w in ipairs(neotree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})

keymap.n("<leader>e", "<cmd>Neotree toggle<cr>", "Toggle Neo-tree")
