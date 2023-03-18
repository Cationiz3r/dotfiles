vim.opt.termguicolors = true

require("bufferline").setup {
	options = {
		middle_mouse_command = "bdelete! %d",
		right_mouse_command = "vertical sbuffer %d",

		indicator = {
			style = "underline",
		},
		modified_icon = "",

		offsets = {{
			filetype = "NvimTree",
			text = "Tree",
			text_align = "center",
			highlight = "NvimTreeHeader",
			separator = " "
		}},

		max_name_length = 18,
		tab_size = 0,
		show_buffer_icons = false, -- on tab buttons
		show_buffer_close_icons = false, -- on tab buttons
		show_close_icon = false, -- end of bar

		separator_style = { "", "" },
	}
}

vim.keymap.set("n", "e", require("core.utils").close_buffer)
vim.keymap.set("n", "<s-Tab>", "<Cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "1", "<Cmd>BufferLineGoToBuffer 1<CR>")
vim.keymap.set("n", "2", "<Cmd>BufferLineGoToBuffer 2<CR>")
vim.keymap.set("n", "3", "<Cmd>BufferLineGoToBuffer 3<CR>")
vim.keymap.set("n", "4", "<Cmd>BufferLineGoToBuffer 4<CR>")
vim.keymap.set("n", "5", "<Cmd>BufferLineGoToBuffer 5<CR>")
vim.keymap.set("n", "6", "<Cmd>BufferLineGoToBuffer 6<CR>")
vim.keymap.set("n", "7", "<Cmd>BufferLineGoToBuffer 7<CR>")
vim.keymap.set("n", "8", "<Cmd>BufferLineGoToBuffer 8<CR>")
vim.keymap.set("n", "9", "<Cmd>BufferLineGoToBuffer 9<CR>")
