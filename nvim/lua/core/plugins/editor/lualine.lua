require("lualine").setup {
	options = {
		icons_enabled = true,
		theme = require("core.plugins.editor.lualine-theme"),
		component_separators = { left = '', right = ''},
		section_separators   = { left = '', right = ''},
		disabled_filetypes = {
			"packer",
			"NvimTree",
		},
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
	inactive_sections = {
		lualine_b = {
			"branch",
		},
		lualine_x = {},
		lualine_y = {
			"location",
		},
	},
}
