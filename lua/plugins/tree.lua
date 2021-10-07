-- https://github.com/kyazdani42/nvim-tree.lua/issues/674
vim.g.nvim_tree_ignore = { ".git" }
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1

require("nvim-tree").setup({
  disable_netrw = false,
  auto_close = true,
  lsp_diagnostics = true,
  update_focused_file = {
    enable = true,
  },
})
