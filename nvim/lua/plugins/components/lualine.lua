local mode_icons = {
	NORMAL = " ",
	VISUAL = " ",
	["V-LINE"] = " ",
	INSERT = " ",
	REPLACE = " ",
	COMMAND = " ",
	SELECT = " ",
	["O-PENDING"] = " "
}

require("lualine").setup {
	options = {
		icons_enabled = true,
		theme = require("plugins.theme.lualine"),
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
			{
				"filename",
				path = 1,
			},
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
		lualine_y = {
			{
				"fileformat",
				icons_enabled = false,
			},
			{
				"filetype",
				colored = false,
				icons_enabled = false,
			},
			"progress",
		},
	},
	inactive_sections = {
		lualine_b = {
			"branch",
		},
		lualine_x = {},
		lualine_y = {
			"progress",
		},
	},
}
