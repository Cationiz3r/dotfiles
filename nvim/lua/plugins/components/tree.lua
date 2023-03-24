vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require("nvim-tree.api")
local open_no_focus = function()
	api.node.open.edit()
	api.tree.focus()
end

local function on_attach(bufnr)
	vim.keymap.set("n", "<Tab>", "<c-w>p", { buffer = bufnr })
	vim.keymap.set("n", "<a-t>", "<cmd>NvimTreeClose<CR>", { buffer = bufnr })
	vim.keymap.set("n", "<s-CR>", open_no_focus, { buffer = bufnr })
	vim.keymap.set("n", "<s-o>", open_no_focus, { buffer = bufnr })
end

require("nvim-tree").setup({
	on_attach = on_attach,
	reload_on_bufenter = true,
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
		highlight_opened_files = "all",
		indent_width = 1,
		icons = {
			webdev_colors = false,
			git_placement = "after",
			symlink_arrow = " -> ",
			show = {
				file = false,
				folder = false,
			},
			glyphs = {
				default = "",
				folder = {
					arrow_closed = "", -- E930
					arrow_open = "", -- E92E
				},
				git = {
					unstaged = "", -- EA11
					staged = "", -- E92B
					unmerged = "", -- E974
					renamed = "", -- E912
					untracked = "", -- E9E1
					deleted = "", -- E955
					ignored = "", -- E937
				},
			},
		}
	}
})
