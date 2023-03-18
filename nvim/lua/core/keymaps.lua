--- NORMAL
-- File operations
vim.keymap.set("n", "q", ":q<CR>")
vim.keymap.set("n", "<leader>d", ":qa!<CR>")
vim.keymap.set("n", "<leader>q", ":wqa<CR>")
vim.keymap.set("n", "<leader>w", ":wq<CR>")
vim.keymap.set("n", "s", ":w<CR>")
vim.keymap.set("n", "<leader>h", ":noh<CR>")
vim.keymap.set("n", "r", ":source %<CR>")

-- Un/Redo
vim.keymap.set("n", "z", ":silent undo<CR>")
vim.keymap.set("n", "x", ":silent redo<CR>")
