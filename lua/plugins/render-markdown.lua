return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	ft = { "markdown" },
	config = function()
		require("render-markdown").setup({
			headings = { "█", "█", "▇", "▆", "▅", "▃" },
			bullets = { "◉", "○", "✸", "✿" },
			dash = "─",
			quote = "┃",
			code = { "┌", "│", "└" },
			checkbox = {
				[" "] = "☐",
				["x"] = "☒",
				["-"] = "",
			},
		})
	end,
}
