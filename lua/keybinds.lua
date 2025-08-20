local key = vim.keymap.set
-- local nkey = vim.api.nvim_set_keymap

-- neovim
key("n", "<leader>7", function()
	vim.cmd(":nohlsearch")
end, { noremap = true })

key("n", "<C-c>", "<esc>")

key("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Open lazy menu" })

key("n", "<leader>bf", function()
	-- Try LSP formatting first, fall back to Conform
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients > 0 then
		vim.lsp.buf.format()
	else
		-- Fall back to Conform formatting
		local conform = require("conform")
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		})
	end
end, { desc = "Format buffer (LSP or Conform fallback)" })

-- Oil
key("n", "<leader>s", "<cmd>Oil<cr>", { desc = "Open parent directory" })

-- FzfLua
key("n", "<leader>t", "<cmd>FzfLua files<cr>", { desc = "Open fzf-lua menu" })
key("n", "<leader>r", "<cmd>FzfLua oldfiles<cr>", { desc = "Open fzf-lua old files menu" })

-- Transparent
key("n", "T", "<cmd>TransparentToggle<cr>", { desc = "Toggle transparent background" })

-- Twilight
key("n", "<leader>tw", "<cmd>Twilight<cr>", { desc = "Toggle twilight" })

-- Mason
key("n", "<leader>ms", "<cmd>Mason<cr>", { desc = "Open Mason menu" })

-- Undotree
key("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle undo-tree" })

-- GitDiff
key("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Open Diffview" })
key("n", "<leader>gc", ":DiffviewClose<CR>", { desc = "Close Diffview" })
