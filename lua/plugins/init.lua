-- all plugins default to lazy=true; to load a plugin on startup specify lazy=false

-- TODO: remove before merging to main
-- Question: Do we want to specify default lazy=true or false?
-- From the docs: Plugins will be lazy-loaded when one of the following is true:
--
-- * The plugin only exists as a dependency in your spec
-- * It has an event, cmd, ft or keys key
-- * config.defaults.lazy == true

return {
	-- UI
  {"Mofiqul/dracula.nvim", lazy = false, priority = 1000 },
	{
		"nvim-lualine/lualine.nvim",
    event = "VeryLazy",
		opts = function()
			return require "plugins.configs.lualine"
		end,
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},

	-- editor
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
    cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = function()
			return require "plugins.configs.neotree"
		end,
		config = function(_, opts)
			require("neo-tree").setup(opts)
		end,
	},

	-- code: LSP, formatters, linters, completion
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		opts = function()
			return require "plugins.configs.treesitter"
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre"  },
    config = function()
      require "plugins.configs.lspconfig"
    end,
		config = function(_)
      -- TODO: refactor this, but first get mason, linter and formatters somehow integrated and only then refactor
      -- Init language server protocol config
      local nvim_lsp = require("lspconfig")

      local servers = {
        bashls = {},
        julials = {},
        ltex = { language = "en-US" },
        marksman = {},
        pyright = {},
        r_language_server = {},
        texlab = {
          settings = {
            texlab = {
              auxDirectory = "build",
              build = {
                onSave = true,
                forwardSearchAfter = true,
                args = {
                  "-pdf",
                  "-shell-escape",
                  "-interaction=nonstopmode",
                  "-synctex=1",
                  "%f",
                  "-outdir=build",
                },
              },
              forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" },
              },
            },
          },
        },
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local options = {
        -- TODO: do we need on_attach? see lsp/init.lua for how on_attach is defined for null lsp
        -- on_attach = on_attach,
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 150,
        },
      }

      for server, cfg in pairs(servers) do
        nvim_lsp[server].setup(vim.tbl_extend("keep", options, cfg))
      end
		end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
    },
		opts = function()
			return require "plugins.configs.cmp"
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
  },

	-- dependencies
  {"nvim-lua/plenary.nvim", lazy = true },
  {"nvim-tree/nvim-web-devicons", lazy = true },
  {"MunifTanjim/nui.nvim", lazy = true},
}
