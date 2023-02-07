local mode_icons = {
	NORMAL = " ",
	VISUAL = " ",
	["V-LINE"] = " ",
	INSERT = " ",
	REPLACE = " ",
	COMMAND = " ",
	["O-PENDING"] = " "
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
					return mode_icons[mode] .. mode
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
			{
				"diagnostics",
				diagnostics_color = {
					error = "DiagnosticError",
					warn  = "DiagnosticWarn",
					info  = "DiagnosticInfo",
					hint  = "DiagnosticHint",
				},
				symbols = {
					error = " ",
					warn = " ",
					info = " ",
					hint = " ",
				},
			},
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
