return {
  formatters_by_ft = {
    css = { "prettier" },
    sh = { "shfmt" },
    fish = { "fish_indent" },
    html = { "prettier" },
    json = { "prettier" },
    lua = { "stylua" },
    markdown = { "prettier" },
    python = { "ruff_fix", "ruff_format" },
    yaml = { "prettier" },
  },
}
