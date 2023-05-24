local cmp = require("cmp")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load() -- VSCode snippets

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			menu = ({
				buffer = "[Buf]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[Latex]",
			})
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<c-b>"] = cmp.mapping.scroll_docs(-4),
		["<c-f>"] = cmp.mapping.scroll_docs(4),
		["<c-o>"] = cmp.mapping.complete(),
		["<c-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})
