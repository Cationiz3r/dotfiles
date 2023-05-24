require("mason-tool-installer").setup({
	ensure_installed = {
		-- LSP
		"clangd", -- C, C++
		"jdtls", -- Java
		"lua-language-server", -- Lua
		"jedi-language-server", -- Python
		"lemminx", -- XML

		-- Linter
		"pylint", -- Python
	},
})
