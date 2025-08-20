return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("diffview").setup({
			-- New configuration format for diffview 136+
			view = {
				default = {
					layout = "diff2_horizontal",
					winbar_info = false,
				},
				file_panel = {
					layout = "diff2_horizontal",
					winbar_info = false,
				},
			},
			-- Panel sizing
			panels = {
				width = 35,
			},
		})
	end,
}
