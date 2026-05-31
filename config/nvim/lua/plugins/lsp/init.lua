-- lua/plugins/lsp/init.lua

local mason = plug("mason")
if not mason then
  return
end

mason.setup()

-- Auto-install packages listed in packages.lua
local packages = require("plugins.lsp.packages")
local mr = require("mason-registry")
mr.refresh(function()
  for _, name in ipairs(packages) do
    local ok, pkg = pcall(mr.get_package, name)
    if ok and not pkg:is_installed() then
      pkg:install()
    end
  end
end)

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local buf = event.buf
    local ok, fzf = pcall(require, "fzf-lua")
    keymap.n("gd", ok and fzf.lsp_definitions or vim.lsp.buf.definition, "Go to definition", buf)
    keymap.n("gD", ok and fzf.lsp_declarations or vim.lsp.buf.declaration, "Go to declaration", buf)
    keymap.n("gr", ok and fzf.lsp_references or vim.lsp.buf.references, "Go to references", buf)
    keymap.n("gi", ok and fzf.lsp_implementations or vim.lsp.buf.implementation, "Go to implementation", buf)
    keymap.n("K", vim.lsp.buf.hover, "Hover documentation", buf)
    keymap.n("<leader>rn", vim.lsp.buf.rename, "Rename symbol", buf)
    keymap.n("<leader>ca", ok and fzf.lsp_code_actions or vim.lsp.buf.code_action, "Code action", buf)
    keymap.n("[d", function()
      vim.diagnostic.jump({ count = -1 })
    end, "Previous diagnostic", buf)
    keymap.n("]d", function()
      vim.diagnostic.jump({ count = 1 })
    end, "Next diagnostic", buf)
  end,
})

require("plugins.lsp.servers")
