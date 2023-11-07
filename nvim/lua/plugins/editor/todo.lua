local no_icon = { icon = "" }

require("todo-comments").setup({
	signs = false,
	keywords = {
		FIX  = no_icon,
		TODO = no_icon,
		HACK = no_icon,
		WARN = no_icon,
		PERF = no_icon,
		NOTE = no_icon,
		TEST = no_icon,
	}
})
