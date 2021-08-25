local nls = require("null-ls")

local M = {}

function M.setup(client, buf)
    nls.config({
        sources = {
            nls.builtins.diagnostics.flake8,
            nls.builtins.formatting.isort,
            nls.builtins.formatting.yapf,
        }
    })
end

return M
