local palette = {
	-- Normal text
	bg = "#181818",
	fg = "#dddddd",

	-- Special
	bg_light = "#333333",
	fg_light = "#ffffff",
	dimmed = "#666666",
	void = "#000000",
	transparent = "#111111",
	menu = "#202020",

	-- Diagnostics
	red = "#aa0000",
	error = "#ff0000",
	warn = "#ffff00",

	-- The greys
	g_0 = "#737373",
	g_1 = "#808080",
	g_2 = "#8c8c8c",
	g_3 = "#999999",
	g_4 = "#a6a6a6",
	g_5 = "#b3b3b3",
	g_6 = "#bfbfbf",
	g_7 = "#cccccc",
	g_8 = "#d9d9d9",
	g_9 = "#e6e6e6",
	g_10 = "#f2f2f2",
}

local highlights = {
	MoreMsg = { fg = palette.dimmed, bold = true },
	Error = { fg = palette.error, bold = true },
	CursorLine = { bg = palette.bg_light, bold = true },
	CursorLineNr = { link = "CursorLine" },
	CursorLineSign = { link = "CursorLine" },
	CursorLineFold = { link = "CursorLine" },
	Search = { bg = palette.g_3, fg = palette.void, bold = true },
	Comment = { fg = palette.dimmed, italic = true },

	DiagnosticError = { link = "Error" },
	DiagnosticVirtualTextError = { link = "Error" },
	DiagnosticFloatingError = { link = "Error" },
	DiagnosticSignError = { link = "Error" },
	DiagnosticUnderlineError = {
		fg = palette.error,
		sp = palette.error,
		bold = true,
		undercurl = true,
	},
	DiagnosticWarn = { fg = palette.warn },
	DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
	DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
	DiagnosticSignWarn = { link = "DiagnosticWarn" },
	DiagnosticUnderlineWarn = { sp = palette.warn, undercurl = true },
	DiagnosticUnnecessary = { link = "DiagnosticUnderlineWarn" },
	DiagnosticInfo = { fg = palette.fg_light, bold = true },
	DiagnosticHint = { fg = palette.fg_light, bold = true },
	DiagnosticSignInfo = { link = "DiagnosticInfo" },
	DiagnosticSignHint = { link = "DiagnosticHint" },

	DiagnosticSignCursorError = { bg = palette.bg_light, fg = palette.error },
	DiagnosticSignCursorWarn = { bg = palette.bg_light, fg = palette.warn },
	DiagnosticSignCursorInfo = { bg = palette.bg_light, fg = palette.fg_light },
	DiagnosticSignCursorHint = { bg = palette.bg_light, fg = palette.fg_light },

	BufferLineBufferSelected = { fg = palette.fg_light, bold = true },
	BufferLineIndicatorSelected = { link = "BufferLineBufferSelected" },
	BufferLineModifiedSelected = { link = "BufferLineIndicatorSelected" },
	BufferLineBufferVisible = { fg = palette.g_5, bold = true },
	BufferLineIndicatorVisible = { link = "BufferLineBufferVisible" },
	BufferLineModifiedVisible = { link = "BufferLineBufferVisible" },
	BufferLineDuplicateSelected = {
		fg = palette.g_4,
		italic = true,
		bold = true,
	},
	BufferLineDuplicateVisible = { fg = palette.dimmed, italic = true },
	BufferLineOffsetSeparator = { link = "VertSplit" },

	LuaLineDiffAdd = {
		bg = palette.bg_light,
		fg = palette.fg_light,
		bold = true,
	},
	LuaLineDiffModified = {
		bg = palette.bg_light,
		fg = palette.warn,
		bold = true,
	},
	LuaLineDiffRemoved = {
		bg = palette.bg_light,
		fg = palette.error,
		bold = true,
	},

	GitSignsAdd = { fg = palette.fg_light },
	GitSignsChange = { fg = palette.error, bold = true },

	NvimTreeHeader = { link = "BufferLineBufferSelected" },
	NvimTreeNormal = { bg = palette.bg, fg = palette.g_2 },
	NvimTreeOpenedFile = { fg = palette.fg_light, bold = true },
	NvimTreeFolderName = { fg = palette.g_8, bold = true },
	NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
	NvimTreeIndentMarker = { link = "NvimTreeFolderName" },
	NvimTreeWindowPicker = {
		bg = palette.bg_light,
		fg = palette.fg_light,
		bold = true,
	},
	NvimTreeGitDirty = { fg = palette.error, bold = true },
	NvimTreeGitStaged = { fg = palette.fg_light, bold = true },

	Float = { bg = palette.menu },
	LspFloatWinNormal = { link = "Float" },
	NormalFloat = { link = "Float" },
	NvimFloat = { link = "Float" },

	PmenuSel = { fg = palette.fg_light, bg = palette.bg_light, bold = true },

	CmpItemAbbrMatch = { fg = palette.fg_light, bold = true },
	CmpItemMenu = { fg = palette.dimmed },
	CmpItemMenuDefault = { link = "CmpItemMenu" },

	[ "@text.diff.add.diff" ] = { fg = palette.fg_light, bold = true },
	[ "@text.diff.delete.diff" ] = { fg = palette.error, bold = true },

	TelescopeNormal = { bg = palette.menu },
	TelescopePromptBorder = { bg = palette.menu, fg = palette.menu },
	TelescopePromptPrefix = { link = "TelescopePromptNormal" },
	TelescopePromptTitle = { link = "TelescopePromptNormal" },
	TelescopePromptNormal = {
		bg = palette.menu,
		fg = palette.fg_light,
		bold = true,
	},
	TelescopeResultsBorder = { link = "TelescopePromptBorder" },
	TelescopeResultsTitle = { link = "TelescopePromptTitle" },
	TelescopePreviewBorder = { link = "TelescopePromptBorder" },
	TelescopePreviewTitle = { link = "TelescopePromptTitle" },
	TelescopePreviewLine = { bg = palette.bg_light, bold = true },
	TelescopeSelection = {
		bg = palette.bg_light,
		fg = palette.fg_light,
		bold = true,
	},
	TelescopeMatching = { link = "TelescopeSelection" },

	TodoBgFIX = { bg = palette.error, fg = palette.void, bold = true },
	TodoFgFIX = { fg = palette.error, bold = true },

	lsp_markdown4 = { fg = palette.g_4 },
	markdownListMarker = { fg = palette.fg_light, bold = true },
	markdownCode = { fg = palette.fg_light },
	markdownItalic = { fg = palette.fg_light, italic = true },
	rustModPath = { link = "@lsp.type.namespace.rust" },

	markdownH1 = { fg = palette.fg_light, bold = true, undercurl = true },
	markdownH2 = { link = "markdownH1" },
	markdownH3 = { link = "markdownH1" },
	markdownH4 = { link = "markdownH1" },
	markdownH5 = { link = "markdownH1" },
	markdownH6 = { link = "markdownH1" },
	markdownH1Delimiter = {
		fg = palette.fg_light,
		bold = true,
		undercurl = true,
	},
	markdownH2Delimiter = { link = "markdownH1Delimiter" },
	markdownH3Delimiter = { link = "markdownH2Delimiter" },
	markdownH4Delimiter = { link = "markdownH1Delimiter" },
	markdownH5Delimiter = { link = "markdownH1Delimiter" },
	markdownH6Delimiter = { link = "markdownH1Delimiter" },
}

return {
	highlights = highlights,
	palette = palette,
}
