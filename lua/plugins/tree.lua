require("nvim-tree").setup({
  disable_netrw = false,
  diagnostics = { enable = true },
  update_focused_file = { enable = true },
  git = { ignore = true },
  renderer = {
    indent_markers = {
      enable = true,
    },
    highlight_git = true,
  },
  actions = {
    open_file = {
      window_picker = {
        enable = true,
      },
    },
  },
})
