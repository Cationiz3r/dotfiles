require("gitsigns").setup()

-- Update nvimtree
vim.api.nvim_create_autocmd("User", {
	pattern = "GitSignsUpdate",
	callback = require("nvim-tree.api").tree.reload,
})
