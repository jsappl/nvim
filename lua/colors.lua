-- Color settings

vim.opt.termguicolors = true

vim.cmd("colorscheme dracula")
require("lualine").setup{
    options = {
        theme = "dracula",
        icons_enabled = false,
    }
}

require("nvim-treesitter.configs").setup{
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    }
}
