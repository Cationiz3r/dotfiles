require("mason-tool-installer").setup({
	ensure_installed = {
		-- LSP
		"clangd", -- C, C++
		"jdtls", -- Java
		"lua_ls", -- Lua
		"jedi_language_server", -- Python
		"lemminx", -- XML

		-- Linter
		"pylint", -- Python
	},
})
