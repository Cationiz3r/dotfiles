-- Remove trailing whitespace
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*",
		command = ":%s/\\s\\+$//e|noh"
	}
)

-- Lilypond compile
vim.api.nvim_create_autocmd(
	"BufWritePost", {
		pattern = "*.ly",
		command = "!lilypond %"
	}
)
