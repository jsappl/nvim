-- Init language server protocol config
local nvim_lsp = require("lspconfig")

local function on_attach(client, bufnr)
  require("lsp.keys").setup(client, bufnr)
  require("lsp.signature").setup(client, bufnr)
  require("lsp.completion").setup(client, bufnr)
  require("lsp.formatting").setup(client, bufnr)
end

require("lsp.null-ls").setup()

local servers = {
  pyright = {},
  gopls = {},
  julials = {},
  texlab = {},
  ["null-ls"] = {},
}
for server, cfg in pairs(servers) do
  nvim_lsp[server].setup({
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
  })
end
