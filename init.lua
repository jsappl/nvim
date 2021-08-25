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
require("paq"){
    "savq/paq-nvim";  -- Let Paq manage itself

    "Mofiqul/dracula.nvim";

    "hoob3rt/lualine.nvim";
    --{"kyazdani42/nvim-web-devicons", opt=true};

    {"nvim-treesitter/nvim-treesitter", run="TSUpdate"};

    "neovim/nvim-lspconfig";

    "hrsh7th/nvim-compe";
    "ray-x/lsp_signature.nvim";

    --{"lervag/vimtex", opt=true};  -- Use braces when passing options

    "nvim-lua/plenary.nvim";

    "jose-elias-alvarez/null-ls.nvim"; -- requires plenary and lspconfig
}

-- Source config files

require("settings")
require("colors")
require("lsp")
require("mappings")

require("plugins.compe")
