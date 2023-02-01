require("lualine").setup {
	options = {
		icons_enabled = false,
		theme = "dracula-nvim",
		component_separators = { left = '', right = ''},
		section_separators   = { left = '', right = ''},
	},
	sections = {
		lualine_x = { "encoding", "filetype" },
	},
}
