-- lua/plugins/render-markdown.lua

local rm = plug("render-markdown")
if not rm then return end

rm.setup({
  render_modes = { "n", "c" }, -- render in normal and command mode; raw in insert
})
