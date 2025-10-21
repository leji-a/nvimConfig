vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.wrap = true
vim.o.breakindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.termguicolors = true
vim.g.mapleader = " "
vim.loader.enable()

vim.g.skip_ts_context_commentstring_module = true
vim.o.lazyredraw = true
vim.o.ttyfast = true
vim.o.updatetime = 100
vim.o.timeoutlen = 300

vim.o.mousescroll = "ver:3,hor:6"
vim.o.mousefocus = true
vim.o.mousemoveevent = true
vim.o.smoothscroll = true
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.modeline = false
vim.o.modelines = 0

vim.opt.shortmess = vim.opt.shortmess + "I"
