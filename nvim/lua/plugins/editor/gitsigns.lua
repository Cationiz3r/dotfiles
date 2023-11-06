local gitsigns = require("gitsigns")

gitsigns.setup({
	signs = {
		delete = { text = "" }, -- E92E
		topdelete = { text = "" }, -- temp
	},
	_extmark_signs = false, -- Use vimfn for cursorline highlight
})

-- Attach immediately so highlight forcing would work
gitsigns.attach(0)

-- Highlight cursorline in signs column
-- Credit: https://github.com/m-wells
-- https://github.com/lewis6991/gitsigns.nvim/issues/563
vim.defer_fn(function()
	local bg = vim.api.nvim_get_hl(0, { name = "SignColumn", link = false }).bg
	local cl_bg = vim.api.nvim_get_hl(0, { name = "CursorLineSign", link = false }).bg
	for _, sign in ipairs(vim.fn.sign_getdefined()) do
		local hl = vim.api.nvim_get_hl(0, { name = sign.texthl, link = false })
		local name = sign.texthl
		vim.api.nvim_set_hl(0, name, { fg = hl.fg, bg = bg })
		name = name .. "Cul"
		vim.api.nvim_set_hl(0, name, { fg = hl.fg, bg = cl_bg })
		vim.fn.sign_define(sign.name, { culhl = name })
	end
end, 10)

-- Update nvimtree
vim.api.nvim_create_autocmd("User", {
	pattern = "GitSignsUpdate",
	callback = require("nvim-tree.api").tree.reload,
})
