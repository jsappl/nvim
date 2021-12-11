-- https://github.com/kyazdani42/nvim-tree.lua/issues/674
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_disable_window_picker = 1

require("nvim-tree").setup({
  disable_netrw = false,
  auto_close = true,
  diagnostics = { enable = true },
  update_focused_file = { enable = true },
  git = { ignore = true },
})
-- Check defaults: https://github.com/kyazdani42/nvim-tree.lua
