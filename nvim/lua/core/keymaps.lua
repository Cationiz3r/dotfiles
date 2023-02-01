--- NORMAL
-- File operations
vim.keymap.set("n", "<c-d>", ":qa!<CR>")
vim.keymap.set("n", "<c-q>", ":wqa<CR>")
vim.keymap.set("n", "<c-w>", ":wq<CR>")
vim.keymap.set("n", "<c-s>", ":w<CR>")
vim.keymap.set("n", "<c-r>", ":source %<CR>")

-- Line operations
vim.keymap.set("n", "<c-j>", "yy$p")
vim.keymap.set("n", "<c-k>", "dd")

-- Un/Redo
vim.keymap.set("n", "<c-z>", ":undo<CR>")
vim.keymap.set("n", "<c-y>", ":redo<CR>")

-- Visual shortcuts
vim.keymap.set("n", "<s-Up>",    "v<Up>")
vim.keymap.set("n", "<s-Down>",  "v<Down>")
vim.keymap.set("n", "<s-Left>",  "v<Left>")
vim.keymap.set("n", "<s-Right>", "v<Right>")

--- VISUAL
-- Edit
vim.keymap.set("v", "<c-c>", "y")
vim.keymap.set("v", "<c-x>", "x")
vim.keymap.set("v", "<c-v>", "p")
