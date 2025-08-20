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

-- Neovim 0.12 optimizations
vim.opt.mousescroll = "ver:3,hor:6"
vim.opt.mousefocus = true
vim.opt.mousemoveevent = true
vim.opt.smoothscroll = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
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