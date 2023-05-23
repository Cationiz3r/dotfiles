require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd", -- C, C++
		"jdtls", -- Java
		"lua_ls", -- Lua
		"jedi_language_server", -- Python
		"lemminx", -- XML
	},
})
