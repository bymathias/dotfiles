-- lua/config/helpers.lua

-- Global helpers assigned to _G so no import is needed anywhere in the config.

-- ╭─────────────────────────────────────────╮
-- │ keymap                                  │
-- ╰─────────────────────────────────────────╯
-- Usage (global):  keymap.n("<leader>ff", fzf.files, "Find files")
-- Usage (buffer):  keymap.n("gd", vim.lsp.buf.definition, "Go to definition", bufnr)
_G.keymap = {
  n = function(key, fn, desc, bufnr)
    vim.keymap.set("n", key, fn, { desc = desc, buffer = bufnr })
  end,
  v = function(key, fn, desc, bufnr)
    vim.keymap.set("v", key, fn, { desc = desc, buffer = bufnr })
  end,
  i = function(key, fn, desc, bufnr)
    vim.keymap.set("i", key, fn, { desc = desc, buffer = bufnr })
  end,
}

-- ╭─────────────────────────────────────────╮
-- │ plug(pack_name, mod_name?)              │
-- ╰─────────────────────────────────────────╯
-- Guards require() behind a vim.pack active-check. Returns the module or nil.
-- Two failure modes: pack not active (WARN), require() error (ERROR).
--
-- Usage:
--   local fzf = plug("fzf-lua")
--   local ap  = plug("autopairs", "nvim-autopairs")
--   if not fzf then return end
_G.plug = function(pack_name, mod_name)
  mod_name = mod_name or pack_name

  local info = vim.pack.get({ pack_name })

  if not (info and info[1] and info[1].active) then
    vim.notify("[plug] NOT loaded: " .. pack_name, vim.log.levels.WARN)
    return nil
  end

  local ok, result = pcall(require, mod_name)

  if not ok then
    vim.notify("[plug] Failed to require: " .. mod_name .. "\n" .. result, vim.log.levels.ERROR)
    return nil
  end

  return result
end
