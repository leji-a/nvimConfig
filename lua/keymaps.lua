local keymap = vim.keymap.set

keymap("n", "<leader>s", ":Ex<CR>", { desc = "Open Netrw" })

keymap("n", "<leader>lz", ":Lazy<CR>", { desc = "Open lazy menu" })

keymap("n", "<leader>ms", ":Mason<CR>", { desc = "Open mason menu" })
