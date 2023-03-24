vim.opt.termguicolors = true

require("bufferline").setup {
	options = {
		middle_mouse_command = "bdelete! %d",
		right_mouse_command = "vertical sbuffer %d",

		indicator = {
			style = "underline",
		},
		modified_icon = "",

		max_name_length = 18,
		tab_size = 0,
		show_buffer_icons = false, -- on tab buttons
		show_buffer_close_icons = false, -- on tab buttons
		show_close_icon = false, -- end of bar

		separator_style = { "", "" },
	}
}
