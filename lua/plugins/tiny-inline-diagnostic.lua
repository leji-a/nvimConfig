return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "LspAttach",
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "modern",
			options = {
				show_source = true,
				multilines = true,
			},
		})
		vim.diagnostic.config({ virtual_text = false })
	end,
}
