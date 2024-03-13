local M = {}

-- Inspired by folke/dot files, lot's of room to improve formatting
-- https://github.com/folke/dot/blob/master/config/nvim/lua/config/lsp/formatting.lua

M.autoformat = true

-- TODO refactor
function M.toggle()
  M.autoformat = not M.autoformat
  local hl = "DiagnosticInfo"
  local name = "Formatting"

  -- TODO create some logging utils (https://github.com/folke/dot/blob/master/config/nvim/lua/util/init.lua)
  if M.autoformat then
    vim.api.nvim_echo({ { name .. ": ", hl }, { "enabled format on save" } }, true, {})
  else
    vim.api.nvim_echo({ { name .. ": ", hl }, { "disabled format on save" } }, true, {})
  end
end

function M.format()
  if M.autoformat then
    require("conform").format()
  end
end

function M.setup(client, buf)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua require('lsp.formatting').format()")
  end
end

return M
