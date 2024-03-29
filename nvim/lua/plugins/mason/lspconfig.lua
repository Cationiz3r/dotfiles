local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").bashls.setup {
	capabilities = capabilities,
	filetypes = { "bash", "sh", "zsh" },
}
require("lspconfig").clangd.setup {
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
		"--header-insertion-decorators",
	},
}
require("lspconfig").jdtls.setup {
	capabilities = capabilities,
}
require("lspconfig").emmet_ls.setup {
	capabilities = capabilities,
}
require("lspconfig").lua_ls.setup {
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
	capabilities = capabilities,
}
require("lspconfig").rust_analyzer.setup {
	capabilities = capabilities,
	settings = {
		['rust-analyzer'] = {
			check = {
				command = "clippy",
			},
		},
	},
}
require("lspconfig").lemminx.setup {
	capabilities = capabilities,
	settings = {
		xml = {
			server = {
				workDir = os.getenv("XDG_CACHE_HOME") .. "/lemminx",
			},
		},
	},
}
