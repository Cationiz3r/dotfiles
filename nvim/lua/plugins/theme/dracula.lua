local palette = require("plugins.theme.palette").palette
local overrides = require("plugins.theme.palette").highlights

require("dracula").setup({
	colors = {
		bg = palette.bg,
		fg = palette.fg,
		selection = palette.bg_light,
		comment = palette.dimmed,

    red = palette.red,
    orange = palette.g_0,
    yellow = palette.g_2,
    green = palette.g_4,
    purple = palette.g_6,
    cyan = palette.g_8,
    pink = palette.g_10,
    bright_red = palette.error,
    bright_green = palette.g_1,
    bright_yellow = palette.g_3,
    bright_blue = palette.g_5,
    bright_magenta = palette.g_7,
    bright_cyan = palette.g_9,
    bright_white = palette.fg_light,

    menu = palette.menu,
    visual = palette.bg_light,
		-- gutter_fg = pallete.error,
    nontext = palette.g_8,

		black = palette.transparent,
		white = palette.fg_light,
	},
	overrides = overrides,

	italic_comments = true,
})

-- Use dracula as coloring engine
vim.cmd[[ colorscheme dracula ]]
