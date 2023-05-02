-- Init nvim config
-- Plugin package manager
-- autoinstall Paq
local install_path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  os.execute("git clone --depth 1 https://github.com/savq/paq-nvim.git " .. install_path)
end

-- load Paq
vim.cmd.packadd("paq-nvim")

-- load plugins
require("paq")({
  "savq/paq-nvim", -- Let Paq manage itself
  "Mofiqul/dracula.nvim",
  "hoob3rt/lualine.nvim",

  {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      vim.cmd("TSUpdate")
    end,
  },

  "neovim/nvim-lspconfig",

  "hrsh7th/nvim-cmp", -- completion engine
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",

  "ray-x/lsp_signature.nvim",

  "nvim-lua/plenary.nvim",
  "jose-elias-alvarez/null-ls.nvim", -- requires plenary and lspconfig

  "kyazdani42/nvim-web-devicons",
  "folke/trouble.nvim",

  "simrat39/symbols-outline.nvim",

  "kyazdani42/nvim-tree.lua",

  "mfussenegger/nvim-fzy",

  -- TODO work through their default config, see gitsigns repo
  "lewis6991/gitsigns.nvim",

  "lukas-reineke/indent-blankline.nvim",

  -- TODO work through their default config and replace default_mapping with own
  "rmagatti/goto-preview",

  -- TODO work through their default config, see which-key repo
  "folke/which-key.nvim",
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
require("plugins.preview")
require("plugins.symbolsoutline")
require("plugins.tree")
require("plugins.trouble")
require("plugins.which")
