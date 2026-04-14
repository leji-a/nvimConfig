return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			require("telescope").setup()
			-- Only load fzf if it compiles successfully
			pcall(require("telescope").load_extension, "fzf")
		end,
		keys = {
			{ "ff",         ":Telescope find_files<CR>",  desc = "Find Files" },
			{ "<leader>lg", ":Telescope live_grep<CR>",   desc = "Grep in Files" },
			{ "tb",         ":Telescope buffers<CR>",     desc = "Find Buffers" },
			{ "<leader>fg", ":Telescope oldfiles<CR>",    desc = "Find oldfiles" },
			{ "<leader>fd", ":Telescope diagnostics<CR>", desc = "Telescope diagnostics" }
		},
	},
}
