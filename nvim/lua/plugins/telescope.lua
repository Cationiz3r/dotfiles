local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		prompt_prefix = "❯ ",
		selection_caret = "❯ ",
		color_devicons = false,
		mappings = {
			i = {
				["<ESC>"] = actions.close
			},
		},
	}
})
