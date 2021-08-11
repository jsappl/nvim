-- Linters for various laguages

require("lint").linters_by_ft = { python = {"flake8",} }

vim.cmd([[
au BufWritePost <buffer> lua require("lint").try_lint())
]])
