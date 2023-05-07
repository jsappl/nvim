-- Init Mason (note: needs to be loaded before lspconfig)
-- TODO
--  * Refactor Mason related setups into custom mason module
--  * Use single ensure_installed list
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "ltex",
    "marksman",
  },
})

require("mason-null-ls").setup({
  ensure_installed = {
    -- "black",
    -- "isort",
  },
})

-- Init null-ls
local function on_attach(client, bufnr)
  require("lsp.keys").setup(client, bufnr)
  require("lsp.signature").setup(client, bufnr)
  require("lsp.completion").setup(client, bufnr)
  require("lsp.formatting").setup(client, bufnr)
end

require("lsp.null-ls").setup(on_attach)

-- Init language server protocol config
local nvim_lsp = require("lspconfig")

local servers = {
  bashls = {},
  julials = {},
  ltex = { language = "en-US" },
  marksman = {},
  pyright = {},
  r_language_server = {},
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
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
