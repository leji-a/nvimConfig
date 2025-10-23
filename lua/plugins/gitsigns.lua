---@diagnostic disable: param-type-mismatch
return {
	"lewis6991/gitsigns.nvim",
	config = function()
		-- Path to persist blame toggle state
		local state_file = vim.fn.stdpath("data") .. "/gitsigns_blame_state"

		-- Read persisted state (defaults to false)
		local blame_enabled = false
		local f = io.open(state_file, "r")
		if f then
			local content = f:read("*l")
			f:close()
			if content == "true" then
				blame_enabled = true
			end
		end

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
			current_line_blame = blame_enabled, -- restore state
			preview_config = {
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				-- Helper: persist blame toggle
				local function toggle_blame_persist()
					blame_enabled = not blame_enabled
					gs.toggle_current_line_blame(blame_enabled)

					-- Save state to file
					local f = io.open(state_file, "w")
					if f then
						f:write(tostring(blame_enabled))
						f:close()
					end

					vim.notify("Git blame " .. (blame_enabled and "enabled" or "disabled"), vim.log.levels.INFO)
				end

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
				map("n", "<leader>tb", toggle_blame_persist, { desc = "Toggle current line blame (persistent)" })
				map("n", "<leader>tw", gs.toggle_word_diff, { desc = "Toggle word diff" })

				-- text object
				map({ "o", "x" }, "ih", gs.select_hunk, { desc = "Select hunk" })
			end,
		})
	end,
}
