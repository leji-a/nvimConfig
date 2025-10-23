---@diagnostic disable: param-type-mismatch
return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			numhl = false,
			linehl = false,
			word_diff = false,
			current_line_blame = false,
			preview_config = {
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			on_attach = function(bufnr)
				local gs = require("gitsigns")
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end
				-- navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					gs.nav_hunk("next")
				end, { desc = "Next hunk" })
				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					gs.nav_hunk("prev")
				end, { desc = "Prev hunk" })

				-- actions
				map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)

				map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
				map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
				map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
				map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, { desc = "Diff this ~" })
				map("n", "<leader>hQ", function()
					gs.setqflist("all")
				end, { desc = "Set qflist all" })
				map("n", "<leader>hq", gs.setqflist, { desc = "Set qflist" })

				-- toggles
				map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle current line blame" })
				map("n", "<leader>tw", gs.toggle_word_diff, { desc = "Toggle word diff" })

				-- text object
				map({ "o", "x" }, "ih", gs.select_hunk, { desc = "Select hunk" })
			end,
		})
	end,
}
