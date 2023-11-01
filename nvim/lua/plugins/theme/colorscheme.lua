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

	menu = "#202020",
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
		CursorLine = { bg = colors.selection, bold = true },
		CursorLineNr = { bg = colors.selection, bold = true },
		Search = { bg = colors.bright_yellow, fg = colors.bg, bold = true },

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

		Float = { bg = colors.menu },
		LspFloatWinNormal = { link = "Float" },
		NormalFloat = { link = "Float" },
		NvimFloat = { link = "Float" },

		PmenuSel = { fg = colors.bright_white, bg = colors.selection, bold = true },

		CmpItemAbbrMatch = { fg = colors.bright_white, bold = true },
		CmpItemMenu = { fg = colors.comment },
		CmpItemMenuDefault = { link = "CmpItemMenu" },

		[ "@text.diff.add.diff" ] = { fg = colors.bright_white, bold = true },
		[ "@text.diff.delete.diff" ] = { fg = colors.bright_red, bold = true },

		TelescopeNormal = { bg = colors.menu },
		TelescopePromptBorder = { bg = colors.menu, fg = colors.menu },
		TelescopePromptPrefix = { link = "TelescopePromptNormal" },
		TelescopePromptTitle = { link = "TelescopePromptNormal" },
		TelescopePromptNormal = { bg = colors.menu, fg = colors.bright_white, bold = true },
		TelescopeResultsBorder = { link = "TelescopePromptBorder" },
		TelescopeResultsTitle = { link = "TelescopePromptTitle" },
		TelescopePreviewBorder = { link = "TelescopePromptBorder" },
		TelescopePreviewTitle = { link = "TelescopePromptTitle" },
		TelescopeSelection = { bg = colors.selection, fg = colors.bright_white, bold = true },
		TelescopeMatching = { link = "TelescopeSelection" },
	},

	italic_comments = true,
})

vim.cmd[[ colorscheme dracula ]]

return { -- Passing to custom lualine theme
	colors = colors
}
