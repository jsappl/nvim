local M = {}

M.autoformat = true

function M.toggle()
  M.autoformat = not M.autoformat
  local hl = "DiagnosticInfo"
  local name = "Formatting"

  -- TODO: create some logging utils (https://github.com/folke/dot/blob/master/config/nvim/lua/util/init.lua)
  if M.autoformat then
    vim.api.nvim_echo({ { name .. ": ", hl }, { "enabled format on save" } }, true, {})
  else
    vim.api.nvim_echo({ { name .. ": ", hl }, { "disabled format on save" } }, true, {})
  end
end

function M.format_on_save(args)
  if M.autoformat then
    require("conform").format(args)
  end
end

function M.format_on_key()
  require("conform").format()
end

return M
