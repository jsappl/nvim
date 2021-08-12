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
    --"mfussenegger/nvim-lsp-compl";
    "hrsh7th/nvim-compe";
    "ray-x/lsp_signature.nvim";

    "mfussenegger/nvim-lint";

    --{"lervag/vimtex", opt=true};  -- Use braces when passing options

    -- required in order to make reload-hack work
    "nvim-lua/plenary.nvim";
}

-- Source config files

-- reload-hack: allow reloading lua config
_G.load = function(file)
    require("plenary.reload").reload_module(file, true)
    return require(file)
end
load("settings")
load("colors")
load("languageserver")
load("mappings")
load("linter")
