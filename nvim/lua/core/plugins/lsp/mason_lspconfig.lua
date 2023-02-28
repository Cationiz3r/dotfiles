require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd", -- C, C++
		"lua_ls", -- Lua
		"jedi_language_server", -- Python
		"lemminx", -- XML
	},
})
