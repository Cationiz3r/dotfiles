vim.opt.termguicolors = true

local colors = {
	bg = "#181818",
	fg = "#ffffff",
	selection = "#444444",
	comment = "#666666",

	red = "#ff0000",
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
	visual = "#444444",
	gutter_fg = "#00ff00",
	nontext = "#eeeeee",
}
local err = { fg = colors.bright_red, bold = true }

require("dracula").setup({
	colors = colors,
	overrides = {
		MoreMsg = { fg = colors.comment, bold = true },
		Error = err,
		DiagnosticError = err,
		DiagnosticVirtualTextError = err,
		DiagnosticFloatingError = err,
		DiagnosticSignError = err,
		DiagnosticUnderlineError = { fg = colors.red, sp = colors.red, bold = true, undercurl = true },
		DiagnosticUnderlineWarn = { sp = "#ffff00", undercurl = true },
	},

	italic_comments = true,
})

vim.cmd[[ colorscheme dracula ]]
