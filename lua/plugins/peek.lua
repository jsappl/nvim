local peek = require("peek")

local M = {}

vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
vim.api.nvim_create_user_command("PeekClose", peek.close, {})

function M.setup()
  peek.setup({
    app = "webview",
    theme = "dark",
  })
end

function M.toggle()
  if peek.is_open() then
    peek.close()
  else
    peek.open()
  end
end

return M
