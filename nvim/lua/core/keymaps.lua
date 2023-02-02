--- NORMAL
-- File operations
vim.keymap.set("n", "<leader>d", ":qa!<CR>")
vim.keymap.set("n", "<leader>q", ":wqa<CR>")
vim.keymap.set("n", "<leader>w", ":wq<CR>")
vim.keymap.set("n", "<leader>s", ":w<CR>")
vim.keymap.set("n", "<leader>r", ":source %<CR>")

-- Line operations
vim.keymap.set("n", "<leader>j", "yy$p")
vim.keymap.set("n", "<leader>k", "dd")

-- Un/Redo
vim.keymap.set("n", "<leader>z", ":undo<CR>")
vim.keymap.set("n", "<leader>x", ":redo<CR>")

--- VISUAL
-- Edit
vim.keymap.set("v", "<leader>c", "y")
vim.keymap.set("v", "<leader>x", "x")
vim.keymap.set("v", "<leader>v", "p")
