local keymap = vim.keymap.set

keymap("n", "<leader>s", ":Ex<CR>", { desc = "Open Netrw" })

keymap("n", "<leader>lz", ":Lazy<CR>", { desc = "Open lazy menu" })
