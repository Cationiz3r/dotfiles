vim.opt.termguicolors = true

local colors = {
	bg = "#181818",
	fg = "#dddddd",
	selection = "#333333",
	comment = "#666666",

	red = "#aa0000",
	bright_red = "#ff0000",

	orange = "#676767",
	yellow = "#838383",
	green = "#9e9e9e",
	purple = "#bababa",
	cyan = "#d6d6d6",
	pink = "#f1f1f1",
	bright_orange = "#757575",
	bright_yellow = "#919191",
	bright_green = "#acacac",
	bright_purple = "#c8c8c8",
	bright_cyan = "#d6d6d6",
	bright_white = "#ffffff",

	menu = "#222222",
	visual = "#333333",
	gutter_fg = "#00ff00",
	nontext = "#eeeeee",

	black = "#111111", -- Kitty background color
	white = "#ffffff",
}

require("dracula").setup({
	colors = colors,
	overrides = {
		MoreMsg = { fg = colors.comment, bold = true },
		Error = { fg = colors.bright_red, bold = true },
		DiagnosticError = { link = "Error" },
		DiagnosticVirtualTextError = { link = "Error" },
		DiagnosticFloatingError = { link = "Error" },
		DiagnosticSignError = { link = "Error" },
		DiagnosticUnderlineError = { fg = colors.bright_red, sp = colors.bright_red, bold = true, undercurl = true },
		DiagnosticUnderlineWarn = { sp = "#ffff00", undercurl = true },

		BufferLineBufferSelected = { fg = colors.bright_white, bold = true, underline = true },
		BufferLineIndicatorSelected = { link = "BufferLineBufferSelected" },
		BufferLineModifiedSelected = { link = "BufferLineIndicatorSelected" },
		BufferLineBufferVisible = { fg = colors.bright_green, bold = true, underline = true },
		BufferLineIndicatorVisible = { link = "BufferLineBufferVisible" },
		BufferLineModifiedVisible = { link = "BufferLineBufferVisible" },
		BufferLineOffsetSeparator = { link = "VertSplit" },
	},

	italic_comments = true,
})

vim.cmd[[ colorscheme dracula ]]
