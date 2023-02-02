--- NORMAL
-- File operations
vim.keymap.set("n", "q", ":q<CR>")
vim.keymap.set("n", "<leader>d", ":qa!<CR>")
vim.keymap.set("n", "<leader>q", ":wqa<CR>")
vim.keymap.set("n", "<leader>w", ":wq<CR>")
vim.keymap.set("n", "s", ":w<CR>")
vim.keymap.set("n", "r", ":source %<CR>")

-- Line operations
vim.keymap.set("n", "j", "yy$p")
vim.keymap.set("n", "k", "dd")

-- Un/Redo
vim.keymap.set("n", "z", ":undo<CR>")
vim.keymap.set("n", "x", ":redo<CR>")
