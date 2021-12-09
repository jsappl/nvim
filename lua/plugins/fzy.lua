local fzy = require("fzy")

local M = {}

local function edit_ag_selection(selection)
  if not selection then
    return
  end
  local parts = vim.split(selection, ":")
  local path, line = parts[1], parts[2]
  vim.cmd("e +" .. line .. " " .. path)
end

function M.find_file()
  return fzy.execute("fd --type file", fzy.sinks.edit_file)
end

function M.find_buffer()
  return fzy.actions.buffers()
end

function M.find_tag()
  return fzy.try(fzy.actions.lsp_tags, fzy.actions.buf_tags)
end

function M.find_git_file()
  return fzy.execute("git ls-files", fzy.sinks.edit_file)
end

function M.live_grep()
  return fzy.execute("ag --nobreak --noheading .", edit_ag_selection)
end

return M
