vim.opt.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("eol:↴")

require("ibl").setup({
  scope = { show_start = false, show_end = false },
})
