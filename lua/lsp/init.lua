-- Init language server protocol config
local nvim_lsp = require("lspconfig")

local function on_attach(client, bufnr)
  require("lsp.keys").setup(client, bufnr)
  require("lsp.signature").setup(client, bufnr)
  require("lsp.completion").setup(client, bufnr)
  require("lsp.formatting").setup(client, bufnr)
end

require("lsp.null-ls").setup(on_attach)

local capabilities = vim.lsp.protocol.make_client_capabilities()

local servers = {
  pyright = {},
  julials = {},
  bashls = {},
  texlab = {
    settings = {
      texlab = {
        auxDirectory = "build",
        build = {
          onSave = true,
          forwardSearchAfter = true,
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
  },
  r_language_server = {},
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

for server, cfg in pairs(servers) do
  nvim_lsp[server].setup(vim.tbl_extend("keep", options, cfg))
end
