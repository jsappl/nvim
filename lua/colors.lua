-- Color settings
vim.opt.termguicolors = true

vim.cmd("colorscheme dracula")
require("lualine").setup({
  options = {
    theme = "dracula",
    icons_enabled = false,
  },
})

--- TODO why is this in colors? Move this to appropriate place
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "bibtex",
    "comment",
    "css",
    "fish",
    "html",
    "json",
    "julia",
    "latex",
    "lua",
    "python",
    "r",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
  },
  highlight = {
    enable = true,
  },
})

-- TODO add to dracula theme in order to fully support lsp_signature
vim.api.nvim_command(
  "hi LspSignatureActiveParameter guifg=#282A36 guibg=#FFB86C  gui=Bold,underline,Italic cterm=Bold,underline,Italic guisp=#fbec9f"
)
