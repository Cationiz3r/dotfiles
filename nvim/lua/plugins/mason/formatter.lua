require("formatter").setup({
	filetype = {
		rust = { require("formatter.filetypes.rust").rustfmt },
	},
})

vim.api.nvim_create_autocmd(
	"BufWritePost", {
		pattern = "*",
		command = "FormatWrite"
	}
)
