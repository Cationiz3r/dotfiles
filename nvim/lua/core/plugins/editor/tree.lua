vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
		highlight_opened_files = "all",
		indent_width = 1,
		icons = {
			git_placement = "after",
			show = {
				folder = false,
			},
			glyphs = {
				default = "",
			},
		}
	}
})

vim.keymap.set("n", "t", ":NvimTreeFocus<CR>")
