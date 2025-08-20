vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.wo.relativenumber = true
vim.g.mapleader = " "
vim.loader.enable()
vim.o.guicursor = "n-v-i-c:block-Cursor"

-- Speed up treesitter context commentstring loading
vim.g.skip_ts_context_commentstring_module = true
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
vim.opt.updatetime = 100
vim.opt.timeoutlen = 300

-- LSP timeout settings
vim.lsp.handlers["textDocument/formatting"] = vim.lsp.with(
	vim.lsp.handlers["textDocument/formatting"],
	{ timeout = 5000 }
)
vim.opt.modeline = false
vim.opt.modelines = 0

-- Disable welcome screen
vim.opt.shortmess = vim.opt.shortmess + "I"

-- Auto-open Oil when starting Neovim with no parameters
vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("AutoOpenOil", {}),
	callback = function()
		-- Only open Oil if no file arguments were passed
		if vim.fn.argc() == 0 then
			-- Open Oil in the current working directory with a small delay to ensure proper loading
			vim.defer_fn(function()
				vim.cmd("Oil .")
			end, 100)
		end
	end,
})