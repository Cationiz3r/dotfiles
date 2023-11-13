local palette = require("plugins.theme.palette").pallete

local normal = {
	a = { bg = palette.fg_light, fg = palette.void, gui = "bold" },
	b = { bg = palette.bg_light, fg = palette.fg_light, gui = "bold" },
	c = { bg = palette.bg, fg = palette.fg },
}

return {
	normal = normal,
}
