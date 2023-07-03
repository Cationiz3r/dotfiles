require("mason-tool-installer").setup({
	ensure_installed = {
		-- LSP
		"bash-language-server", -- Bash
		"clangd", -- C, C++
		"jdtls", -- Java
		"emmet-ls", -- HTML, CSS
		"lua-language-server", -- Lua
		"jedi-language-server", -- Python
		"rust-analyzer", -- Rust
		"lemminx", -- XML

		-- Linter
		"pylint", -- Python
	},
})
