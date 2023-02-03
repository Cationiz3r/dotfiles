vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require("nvim-tree.api")
local function on_attach(bufnr)
	vim.keymap.set("n", "<Tab>", "<c-w>p", { buffer = bufnr })
	vim.keymap.set("n", "<s-Tab>", "<c-w>p", { buffer = bufnr })
	vim.keymap.set("n", "e", function()
		api.tree.expand_all()
	end, { buffer = bufnr })
	vim.keymap.set("n", "<s-e>", function()
		api.tree.collapse_all()
	end, { buffer = bufnr })
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
			show = {
				folder = false,
			},
			glyphs = {
				default = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
				},
			},
		}
	}
})

vim.keymap.set("n", "t", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<Tab>", "<c-w>p")
