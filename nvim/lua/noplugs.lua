-- Custom color
vim.api.nvim_set_hl(0, "Normal", { ctermbg = 0, ctermfg = 6 })
vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = 8, ctermfg = 7, bold = 1 })
vim.api.nvim_set_hl(0, "LineNr", { ctermfg = 2 })
vim.api.nvim_set_hl(0, "CursorLineNr", { ctermfg = 6, bold = 1 })
vim.api.nvim_set_hl(0, "EndOfBuffer", { ctermfg = 0 })
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 8 })
vim.api.nvim_set_hl(0, "StatusLine", { ctermfg = 15, bold = 1, reverse = 1 })

-- Set q to immediately quit
local register = require("core.keymaps").register
register({
	q = "<cmd>qa!<CR>",
})
