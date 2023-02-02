vim.opt.termguicolors = true

require("bufferline").setup {
	options = {
		middle_mouse_command = "bdelete! %d",
		right_mouse_command = "vertical sbuffer %d",

		offsets = {{
			filetype = "NvimTree",
			text = "Tree",
			text_align = "center",
			separator = true
		}},

		max_name_length = 18,
		tab_size = 0,
		show_buffer_icons = false, -- on tab buttons
		show_buffer_close_icons = false, -- on tab buttons
		show_close_icon = false, -- end of bar

		separator_style = { "", "" },
	}
}

vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "#191a21" })
vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bold = true })
vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { link = "BufferLineBufferSelected" })
vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", { link = "VertSplit" })
vim.api.nvim_set_hl(0, "BufferLineSeparator", { link = "VertSplit" })
vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { link = "VertSplit" })
vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", { link = "VertSplit" })

vim.keymap.set("n", "<leader>w", ":bp<bar>sp<bar>bn<bar>bd<CR>")
vim.keymap.set("n", "<leader><Tab>", "<Cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>")
vim.keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>")
vim.keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>")
vim.keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>")
vim.keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>")
vim.keymap.set("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>")
vim.keymap.set("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>")
vim.keymap.set("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>")
vim.keymap.set("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>")
