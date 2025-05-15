return {
	"akinsho/toggleterm.nvim",
	config = function(_, opts)
		opts.shell = "/usr/bin/fish"
		require("toggleterm").setup(opts)

		-- Close terminal on <Esc>
		vim.api.nvim_create_autocmd("TermOpen", {
			callback = function()
				vim.keymap.set(
					"t",
					"<Esc>",
					[[<C-\><C-n>:ToggleTerm<CR>]],
					{ buffer = 0, noremap = true, silent = true }
				)
			end,
		})
	end,
}
