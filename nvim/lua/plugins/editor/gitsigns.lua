require("gitsigns").setup({
	signs = {
		delete = { text = "" }, -- E92E
		topdelete = { text = "" }, -- temp
	},
})

-- Update nvimtree
vim.api.nvim_create_autocmd("User", {
	pattern = "GitSignsUpdate",
	callback = require("nvim-tree.api").tree.reload,
})
