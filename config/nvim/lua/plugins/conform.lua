-- lua/plugins/conform.lua

local conform = plug("conform-nvim", "conform")
if not conform then return end

conform.setup({
  formatters_by_ft = {
    lua             = { "stylua" },
    sh              = { "shfmt" },
    bash            = { "shfmt" },
    javascript      = { "prettier" },
    typescript      = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json            = { "prettier" },
    jsonc           = { "prettier" },
    css             = { "prettier" },
    scss            = { "prettier" },
    less            = { "prettier" },
    html            = { "prettier" },
    yaml            = { "prettier" },
    markdown        = { "prettier" },
    python          = { "ruff_format" },
    rust            = { "rustfmt" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

keymap.n("<leader>cf", function()
  conform.format({ async = true })
end, "Format buffer")
