local M = {}

function M.get_servers_from_dir(dir)
  local uv = vim.loop
  local files = uv.fs_scandir(dir)
  local servers = {}
  while true do
    local name = files and uv.fs_scandir_next(files)
    if not name then break end
    if name:match("%.lua$") then
      local server = name:gsub("%.lua$", "")
      table.insert(servers, server)
    end
  end
  return servers
end

return M
