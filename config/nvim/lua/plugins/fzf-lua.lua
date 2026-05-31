-- lua/plugins/fzf-lua.lua

local fzf = plug("fzf-lua")
if not fzf then return end

fzf.setup({
  fzf_opts = {
    ["--pointer"] = "▶",
  },
})

keymap.n("<leader>ff", fzf.files,                "[F]ind [F]iles")
keymap.n("<leader>fg", fzf.live_grep,            "[F]ind [G]rep")
keymap.n("<leader>fb", fzf.buffers,              "[F]ind [B]uffers")
keymap.n("<leader>fh", fzf.helptags,             "[F]ind [H]elp")
keymap.n("<leader>fr", fzf.oldfiles,             "[F]ind [R]ecent files")
keymap.n("<leader>fc", fzf.commands,             "[F]ind [C]ommands")
keymap.n("<leader>fd", fzf.diagnostics_document, "[F]ind [D]iagnostics")
keymap.n("<leader>fk", fzf.keymaps,              "[F]ind [K]eymaps")
