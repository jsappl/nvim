local nls = require("null-ls")

local M = {}

function M.setup(client, buf)
  nls.config({
    sources = {
      nls.builtins.diagnostics.flake8,
      nls.builtins.diagnostics.luacheck,
      nls.builtins.formatting.isort,
      nls.builtins.formatting.prettier.with({
        filetypes = { "html", "json", "yaml", "markdown", "css" },
      }),
      nls.builtins.formatting.yapf,
      nls.builtins.formatting.stylua,
    },
  })
end

return M
