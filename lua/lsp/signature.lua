local lsp_signature = require("lsp_signature")

local M = {}

function M.setup(client, bufnr)
  lsp_signature.on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "single",
    },
  })
end

return M
