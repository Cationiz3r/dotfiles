-- Remove trailing whitespace
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*",
		command = ":%s/\\s\\+$//e|noh"
	}
)

-- Max line length for python
vim.api.nvim_create_autocmd(
	"FileType", {
		pattern = "python",
		command = "set colorcolumn=80"
	}
)
