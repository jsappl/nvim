-- Init nvim config
-- Plugin package manager
-- autoinstall Paq
local install_path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd("!git clone --depth 1 https://github.com/savq/paq-nvim.git " .. install_path)

  -- TODO if we arrive here, we shouldn't continue. Further down it's assumed that Paq is available...
end

-- load Paq
vim.cmd("packadd paq-nvim")

-- load plugins
require("paq")({
  "savq/paq-nvim", -- Let Paq manage itself
  "Mofiqul/dracula.nvim",
  "gkapfham/vim-vitamin-onec",
  "hoob3rt/lualine.nvim",

  { "nvim-treesitter/nvim-treesitter", run = "TSUpdate" },

  "neovim/nvim-lspconfig",

  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",

  "ray-x/lsp_signature.nvim",

  "nvim-lua/plenary.nvim",
  "jose-elias-alvarez/null-ls.nvim", -- requires plenary and lspconfig

  "kyazdani42/nvim-web-devicons",
  "folke/trouble.nvim",

  -- TODO has bug, see issue https://github.com/simrat39/symbols-outline.nvim/issues/61
  "simrat39/symbols-outline.nvim",

  -- TODO adding nvim-tree slows down start up. Status bar shows up with some delay
  "kyazdani42/nvim-tree.lua",

  -- TODO <leader>ff doesn't really work, search window immediately collapses
  "mfussenegger/nvim-fzy",

  -- TODO work through their default config, see gitsigns repo
  "lewis6991/gitsigns.nvim",

  "lukas-reineke/indent-blankline.nvim",
})

-- Source config files

require("colors")
require("lsp")
require("mappings")
require("settings")

require("plugins.cmp")
require("plugins.fzy")
require("plugins.gitsigns")
require("plugins.indent")
require("plugins.tree")
require("plugins.trouble")
