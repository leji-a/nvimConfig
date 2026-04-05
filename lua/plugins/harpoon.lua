return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		vim.keymap.set("n", "<leader>a", function()
			require("harpoon"):list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
		end)

		vim.keymap.set("n", "<C-a>", function()
			require("harpoon"):list():select(1)
		end)
		vim.keymap.set("n", "<C-s>", function()
			require("harpoon"):list():select(2)
		end)
		vim.keymap.set("n", "<C-d>", function()
			require("harpoon"):list():select(3)
		end)
		vim.keymap.set("n", "<C-f>", function()
			require("harpoon"):list():select(4)
		end)

		--Toggle previous & next buffers stored within Harpoon list
		--vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		--vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
	end,
}
