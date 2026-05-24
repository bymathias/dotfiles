-- mason-lspconfig.nvim for automatic LSP server handling
-- https://github.com/mason-org/mason-lspconfig.nvim

local utils = require("utils.fs")
local servers_dir = vim.fn.stdpath("config") .. "/lsp"
local servers = utils.get_servers_from_dir(servers_dir)

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {"williamboman/mason.nvim"},
  opts = {
    ensure_installed = servers,
    automatic_installation = false,
  },
}
