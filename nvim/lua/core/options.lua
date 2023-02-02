vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.cursorline = true -- current line highlight/underline
vim.opt.autoread = true -- load on external change
vim.opt.autowrite = true -- save on change
vim.opt.number = true -- number column
vim.opt.viminfo = NONE -- no history file
vim.opt.scrolloff = 5 -- always visible lines
vim.opt.smartcase = true -- ignore case when search unless contains upper

vim.opt.shiftwidth = 2 -- indent on pressing tab
vim.opt.tabstop = 2 -- space chars for each tab
vim.opt.shiftround = true -- round indent to multiple of shiftwidth
vim.opt.expandtab = false -- replace tab with space
vim.opt.smartindent = true
