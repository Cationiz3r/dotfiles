local on_attach = function(_, _)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "gt", require("telescope.builtin").lsp_references, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").clangd.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
require("lspconfig").jdtls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
require("lspconfig").lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		-- NVIM library
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.stdpath "config" .. "lua"] = true,
				},
			},
		},
	}
}
require("lspconfig").jedi_language_server.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
require("lspconfig").lemminx.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
