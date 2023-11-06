require("plugins.editor.autopairs")
require("plugins.editor.colorizer")
require("plugins.editor.comment")
require("plugins.editor.gitsigns")
require("plugins.editor.illuminate")
require("plugins.editor.indent")
require("plugins.editor.surround")
require("plugins.editor.syntax")

-- LSP signs
local signs = { "Error", "Warn", "Hint", "Info" }
for _, sign in pairs(signs) do
	local hl = "DiagnosticSign" .. sign
	vim.fn.sign_define(hl, {
		text = "┋", -- 250B EB70
		texthl = hl,
	})
end
