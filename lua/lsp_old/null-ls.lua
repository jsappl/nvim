local nls = require("null-ls")

local M = {}

function M.setup(on_attach)
  nls.setup({
    sources = {
      nls.builtins.diagnostics.chktex.with({
        args = { "-q", "-f%l:%c:%d:%k:%n:%m\n" , "-I" },
      }),
      nls.builtins.diagnostics.mypy,
      nls.builtins.diagnostics.flake8,
      nls.builtins.diagnostics.luacheck,
      nls.builtins.diagnostics.shellcheck,
      nls.builtins.formatting.fish_indent,
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
