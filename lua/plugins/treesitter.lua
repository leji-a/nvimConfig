return {
	"nvim-treesitter/nvim-treesitter",
	-- event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local config = require("nvim-treesitter.config")
		---@diagnostic disable-next-line: missing-fields
		config.setup({
			auto_install = true,
			ensure_installed = {
				"lua",
				"typescript",
				"rust",
				"toml",
				"html",
				"css",
				"c",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = { enable = true },
			incremental_selection = { enable = true },
			textobjects = { enable = true },
		})

		require("ts_context_commentstring").setup({})
	end,
}
