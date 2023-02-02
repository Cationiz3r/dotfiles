require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd", -- C, C++
		"sumneko_lua", -- Lua
		"jedi_language_server", -- Python
		"lemminx", -- XML
	},
})
