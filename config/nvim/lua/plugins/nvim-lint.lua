-- lua/plugins/nvim-lint.lua

local lint = plug("nvim-lint", "lint")
if not lint then return end

local eslint_configs = {
  ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yml", ".eslintrc.json",
  "eslint.config.js", "eslint.config.mjs", "eslint.config.cjs",
}

lint.linters_by_ft = {
  sh              = { "shellcheck" },
  bash            = { "shellcheck" },
  python          = { "ruff" },
  javascript      = { "eslint" },
  typescript      = { "eslint" },
  javascriptreact = { "eslint" },
  typescriptreact = { "eslint" },
  yaml            = { "yamllint" },
  markdown        = { "markdownlint-cli2" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
  callback = function()
    local linters = lint.linters_by_ft[vim.bo.filetype] or {}

    -- Skip eslint when no config file exists in the project tree
    linters = vim.tbl_filter(function(name)
      if name ~= "eslint" then return true end
      return vim.fs.find(eslint_configs, {
        path = vim.api.nvim_buf_get_name(0),
        upward = true,
      })[1] ~= nil
    end, linters)

    lint.try_lint(linters)
  end,
})
