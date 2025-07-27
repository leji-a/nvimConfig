local key = vim.keymap.set

-- local nkey = vim.api.nvim_set_keymap

-- neovim
key("n", "<leader>7", function()
	vim.cmd(":nohlsearch")
end, { noremap = true })

key("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Open lazy menu" })

key("n", "<leader>bf", vim.lsp.buf.format, { desc = "buf format" })

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
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>", { desc = "Close Diffview" })
