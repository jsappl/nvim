-- Init nvim config
-- Plugin package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- TODO: nice ordering. mapleader has to be set before lazy (odd)
require("keymaps")

require("lazy").setup("plugins", require("plugins.configs.lazy"))

-- Source other modules
require("settings")
require("colors")

-- load plugins
-- require("paq")({
--   -- TODO PaqInstall will raise an error, as it can't call MasonUpdate yet.
--
--   "ray-x/lsp_signature.nvim",
-- 
--   "jose-elias-alvarez/null-ls.nvim", -- requires plenary and lspconfig
--   "jay-babu/mason-null-ls.nvim",
-- 
--   "folke/trouble.nvim",
-- 
--   "mfussenegger/nvim-fzy",
-- 
--   -- TODO work through their default config, see gitsigns repo
--   "lewis6991/gitsigns.nvim",
-- 
--   "lukas-reineke/indent-blankline.nvim",
-- 
--   -- TODO work through their default config and replace default_mapping with own
--   "rmagatti/goto-preview",
-- 
--   -- TODO work through their default config, see which-key repo
--   "folke/which-key.nvim",
-- 
--   {
--     "toppair/peek.nvim",
--     build = "deno task --quiet build:fast",
--   },
-- 
--   "mfussenegger/nvim-dap",
--   "rcarriga/nvim-dap-ui",
--   "theHamsta/nvim-dap-virtual-text",
--   "mfussenegger/nvim-dap-python",
-- 
--   "norcalli/nvim-colorizer.lua",
-- })
-- 
-- -- Source config files

-- require("lsp")

-- require("plugins.cmp")
-- require("plugins.fzy")
-- require("plugins.gitsigns")
-- require("plugins.indent")
-- require("plugins.peek")
-- require("plugins.preview")
-- require("plugins.trouble")
-- require("plugins.which")
-- require("plugins.dap")
-- require("plugins.colorizer")
