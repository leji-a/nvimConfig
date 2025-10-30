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

-- local nightingale = {
-- 	"xeind/nightingale.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme nightingale")
-- 	end,
-- }

-- local rose_pine = {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- }

return kanagawa
