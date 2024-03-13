-- Init null-ls
local function on_attach(client, bufnr)
  require("lsp.keys").setup(client, bufnr)
  require("lsp.completion").setup(client, bufnr)
end

require("lsp.null-ls").setup(on_attach)

-- Init language server protocol config
local nvim_lsp = require("lspconfig")

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- local options = {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   flags = {
--     debounce_text_changes = 150,
--   },
-- }

-- for server, cfg in pairs(servers) do
--   nvim_lsp[server].setup(vim.tbl_extend("keep", options, cfg))
-- end
