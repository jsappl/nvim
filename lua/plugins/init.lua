return {
	-- UI
	"Mofiqul/dracula.nvim",

	{
		"nvim-lualine/lualine.nvim",
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

	-- LSP, formatters, linters
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = function()
			return require "plugins.configs.treesitter"
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- dependencies
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	"MunifTanjim/nui.nvim",
}
