local M = {}

M.autoformat = true

function M.toggle()
  -- Check
  -- https://github.com/folke/dot/blob/cb117f763f6d135a507f28530ac377034f5cda68/config/nvim/lua/config/lsp/formatting.lua
  -- Auto format (TODO need some capabilities to toggle auto formatting and add manual format keymap (normal, and
  -- visual for range formatting)
end

function M.format()
  if M.autoformat then
    vim.lsp.buf.formatting_sync()
  end
end

function M.setup(client, buf)
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua require('lsp.formatting').format()")
  end
end

return M
