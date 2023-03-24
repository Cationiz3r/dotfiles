--- NORMAL
-- File operations
vim.keymap.set("n", "<leader>qd", ":qa!<CR>")
vim.keymap.set("n", "<leader>qq", ":wqa<CR>")
vim.keymap.set("n", "s", ":w<CR>")
vim.keymap.set("n", "<leader>h", ":noh<CR>")
vim.keymap.set("n", "<leader>r", ":source %<CR>")

-- Un/Redo
vim.keymap.set("n", "z", ":silent undo<CR>")
vim.keymap.set("n", "Z", ":silent redo<CR>")
