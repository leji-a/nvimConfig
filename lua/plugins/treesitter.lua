return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"rust",
				"toml",
				"html",
				"css",
				"python",
				"go",
				"c",
				"cpp",
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

		-- Setup context commentstring with new method
		require("ts_context_commentstring").setup({})
	end,
}
