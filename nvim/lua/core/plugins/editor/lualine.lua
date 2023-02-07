local mode_icons = {
	NORMAL = "",
	VISUAL = "",
	["V-LINE"] = "",
	INSERT = "",
	REPLACE = "",
	COMMAND = "",
}

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
		lualine_a = {
			{
				"mode",
				icons_enabled = true,
				fmt = function(mode)
					return table.concat({ mode_icons[mode], mode }, " ")
				end,
			},
		},
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
