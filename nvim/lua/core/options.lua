vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.cursorline = true -- current line highlight/underline
vim.opt.autoread = true -- load on external change
vim.opt.autowrite = true -- save on change
vim.opt.number = true -- number column
vim.opt.shadafile = "NONE" -- no history file
vim.opt.scrolloff = 5 -- always visible lines
vim.opt.ignorecase = true -- ignore case when search unless contains upper
vim.opt.smartcase = true -- unless query contains uppercase letters
vim.opt.showmode = false -- hide mode in bottom line
vim.opt.fillchars = "vert: "
vim.opt.cmdheight = 0 -- Hide bottom line
vim.opt.splitbelow = true -- Split to bottom half
vim.opt.splitright = true -- Split to right half
vim.opt.colorcolumn = "100"

local tab_size = 2
vim.opt.shiftwidth = tab_size -- indent on pressing tab
vim.opt.tabstop = tab_size -- space chars for each tab
vim.opt.shiftround = true -- round indent to multiple of shiftwidth
vim.opt.expandtab = false -- replace tab with space
vim.opt.smartindent = true
vim.g.python_recommended_style = 0
vim.g.rust_recommended_style = 0

-- Python indent
vim.g.python_indent = {
	open_paren = tab_size,
	nested_paren = tab_size,
	continue = tab_size,
	closed_paren_align_last_line = false,
}
