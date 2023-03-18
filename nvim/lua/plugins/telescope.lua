local telescope = require("telescope.builtin")

vim.keymap.set("n", "<c-p>", telescope.find_files, {})
