local M = {}

function M.setup(client, bufnr)
  -- TODO: Why do we need omnifunc. Interaction with nvim-compe?
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

return M
