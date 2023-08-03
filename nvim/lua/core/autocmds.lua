-- Remove trailing whitespace
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*",
		command = ":%s/\\s\\+$//e|noh"
	}
)
