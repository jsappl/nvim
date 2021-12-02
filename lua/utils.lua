local M = {}

function M.fzy_edit_ag_selection(selection)
  if not selection then
    return
  end
  local parts = vim.split(selection, ":")
  local path, line = parts[1], parts[2]
  vim.cmd("e +" .. line .. " " .. path)
end

return M
