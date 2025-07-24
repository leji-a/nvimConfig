return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("diffview").setup({
			file_panel = {
				width = 35, -- Panel width
			},
		})
	end,
}
