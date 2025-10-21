local kanagawa = {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	opts = {},
	config = function()
		require("kanagawa").setup({
			commentStyle = { italic = true },
			undercurl = true,
			transparent = false,
			theme = "dragon",
		})
		vim.cmd("colorscheme kanagawa")
	end,
}

return kanagawa
