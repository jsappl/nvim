-- Init nvim config

-- Plugin package manager

-- autoinstall Paq
local install_path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd("!git clone --depth 1 https://github.com/savq/paq-nvim.git " .. install_path)
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

    --{"lervag/vimtex", opt=true};  -- Use braces when passing options
}

-- Source config files

require("settings")
require("colors")
require("languageserver")
require("mappings")
require("lspconfig").julials.setup{}
