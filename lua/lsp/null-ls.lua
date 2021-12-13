local nls = require("null-ls")

local M = {}

function M.setup(on_attach)
  nls.setup({
    sources = {
      nls.builtins.diagnostics.chktex,
      nls.builtins.diagnostics.flake8,
      nls.builtins.diagnostics.luacheck,
      nls.builtins.formatting.isort,
      nls.builtins.formatting.prettier.with({
        filetypes = { "html", "json", "yaml", "markdown", "css" },
      }),
      nls.builtins.formatting.yapf,
      nls.builtins.formatting.stylua,
    },
    on_attach = on_attach,
  })
end

return M
