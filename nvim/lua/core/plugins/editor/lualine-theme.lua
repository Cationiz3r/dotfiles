local colors = require("core.plugins.editor.colorscheme").colors

local normal = {
	a = { bg = colors.bright_white, fg = colors.black, gui = "bold" },
	b = { bg = colors.selection, fg = colors.bright_white, gui = "bold" },
	c = { bg = colors.bg, fg = colors.fg },
}

return {
	normal = normal,
}
