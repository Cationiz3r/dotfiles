require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"c",
		"comment",
		"cpp",
		"css",
		"diff",
		"git_rebase",
		"gitignore",
		"html",
		"ini",
		"javascript",
		"json",
		"latex",
		"lua",
		"make",
		"markdown",
		"python",
		"vim",
	},
	highlight = {
		enable = true,
	},
}
