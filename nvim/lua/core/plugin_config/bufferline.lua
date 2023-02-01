vim.opt.termguicolors = true

require("bufferline").setup {
	options = {
		middle_mouse_command = "bdelete! %d",
		offsets = {{
			filetype = "NvimTree",
			text = "Tree",
			text_align = "center",
			separator = true
		}},
	}
}

vim.keymap.set("n", "<c-w>", ":bp<bar>sp<bar>bn<bar>bd<CR>")
vim.keymap.set("n", "<Space><Tab>", ":BufferLineCycleNext<CR>")
