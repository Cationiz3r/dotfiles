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
		"java",
		"javascript",
		"json",
		"latex",
		"lua",
		"make",
		"markdown",
		"python",
		"rust",
		"vim",
	},
	highlight = {
		enable = true,
	},
}
