require("lualine").setup {
	options = {
		icons_enabled = true,
		theme = require("core.plugins.editor.lualine-theme"),
		component_separators = { left = '', right = ''},
		section_separators   = { left = '', right = ''},
	},
	sections = {
		lualine_b = {
			"branch",
			"diff",
		},
		lualine_c = {
			{ "filename", path = 3 },
		},
		lualine_x = {
			"diagnostics",
		},
	},
}
