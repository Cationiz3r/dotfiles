require("mason-tool-installer").setup({
	ensure_installed = {
		-- LSP
		"clangd", -- C, C++
		"jdtls", -- Java
		"emmet-ls", -- HTML, CSS
		"lua-language-server", -- Lua
		"jedi-language-server", -- Python
		"lemminx", -- XML

		-- Linter
		"pylint", -- Python
	},
})
