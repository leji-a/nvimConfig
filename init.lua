local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true

vim.o.undofile = true -- mkdir -p ~/.local/state/nvim/undo
vim.o.undodir = vim.fn.stdpath("cache") .. "/undo"

require("vim-settings")
require("keybinds")

require("lazy").setup("plugins")
