vim.opt.termguicolors = true

local colors = {
	bg = "#181818",
	fg = "#dddddd",
	selection = "#333333",
	comment = "#666666",

	red = "#aa0000",
	bright_red = "#ff0000",
	warn = "#ffff00",

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

	menu = "#444444",
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
		VertSplit = { bg = colors.black },

		DiagnosticError = { link = "Error" },
		DiagnosticVirtualTextError = { link = "Error" },
		DiagnosticFloatingError = { link = "Error" },
		DiagnosticSignError = { link = "Error" },
		DiagnosticUnderlineError = { fg = colors.bright_red, sp = colors.bright_red, bold = true, undercurl = true },
		DiagnosticWarn = { fg = colors.warn, bold = true },
		DiagnosticUnderlineWarn = { sp = colors.warn, undercurl = true },
		DiagnosticInfo = { fg = colors.bright_white, bold = true },
		DiagnosticHint = { fg = colors.bright_white, bold = true },

		BufferLineBufferSelected = { fg = colors.bright_white, bold = true },
		BufferLineIndicatorSelected = { link = "BufferLineBufferSelected" },
		BufferLineModifiedSelected = { link = "BufferLineIndicatorSelected" },
		BufferLineBufferVisible = { fg = colors.bright_green, bold = true },
		BufferLineIndicatorVisible = { link = "BufferLineBufferVisible" },
		BufferLineModifiedVisible = { link = "BufferLineBufferVisible" },
		BufferLineDuplicateSelected = { fg = colors.green, italic = true, bold = true },
		BufferLineDuplicateVisible = { fg = colors.comment, italic = true },
		BufferLineOffsetSeparator = { link = "VertSplit" },

		GitSignsAdd = { fg = colors.bright_white },
		GitSignsChange = { fg = colors.orange },

		NvimTreeHeader = { link = "BufferLineBufferSelected" },
		NvimTreeNormal = { bg = colors.bg, fg = colors.yellow },
		NvimTreeOpenedFile = { fg = colors.bright_white, bold = true },
		NvimTreeFolderName = { fg = colors.cyan, bold = true },
		NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
		NvimTreeIndentMarker = { link = "NvimTreeFolderName" },
		NvimTreeWindowPicker = { bg = colors.selection, fg = colors.white, bold = true },
		NvimTreeGitDirty = { fg = colors.bright_red, bold = true },
		NvimTreeGitStaged = { fg = colors.bright_white, bold = true },
	},

	italic_comments = true,
})

vim.cmd[[ colorscheme dracula ]]

return { -- Passing to custom lualine theme
	colors = colors
}
