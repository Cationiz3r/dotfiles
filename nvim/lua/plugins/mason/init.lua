require("mason").setup({
	ui = {
		icons = {
			package_installed = "", -- E92B
			package_pending = "", -- E930
			package_uninstalled = "", -- EA11
		},
	},
})

require("plugins.mason.installer")
require("plugins.mason.formatter")
require("plugins.mason.linter")
require("plugins.mason.lspconfig")
