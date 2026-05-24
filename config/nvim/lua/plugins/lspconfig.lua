-- nvim-lspconfig is a collection of LSP server configurations for the Nvim LSP client
-- https://github.com/neovim/nvim-lspconfig

local utils = require("utils.fs")
local servers_dir = vim.fn.stdpath("config") .. "/lsp"
local servers = utils.get_servers_from_dir(servers_dir)

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim"
  },
  config = function()
    for _, server in ipairs(servers) do
      local ok, config = pcall(require, "lsp." .. server)
      if not ok then config = {} end
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end,
}
