-- Init language server protocol config
local nvim_lsp = require("lspconfig")

local function on_attach(client, bufnr)
  require("lsp.keys").setup(client, bufnr)
  require("lsp.signature").setup(client, bufnr)
  require("lsp.completion").setup(client, bufnr)
  require("lsp.formatting").setup(client, bufnr)
end

require("lsp.null-ls").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
local servers = {
  pyright = {},
  gopls = {},
  julials = {},
  bashls = {},
  ["null-ls"] = {},
}
for server, _ in pairs(servers) do
  nvim_lsp[server].setup({
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
    flags = { debounce_text_changes = 150 },
  })
end

nvim_lsp.texlab.setup({
  on_attach = on_attach,
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
  flags = { debounce_text_changes = 150 },
  settings = {
    texlab = {
      auxDirectory = "build",
      build = {
        onSave = true,
        forwardSearchAfter = false,
        args = {
          "-pdf",
          "-shell-escape",
          "-interaction=nonstopmode",
          "-synctex=1",
          "%f",
          "-outdir=build",
        },
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
    },
  },
})
