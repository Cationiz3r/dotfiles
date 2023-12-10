require('lsp-progress').setup({
	spinner = {
		"", -- EE06
		"", -- EE07
		"", -- EE08
		"", -- EE09
		"", -- EE0A
		"", -- EE0B
	},
	client_format = function(client_name, spinner, series_messages)
		return #series_messages > 0
			and (table.concat(series_messages, ", ") .. "  " .. spinner .. " " .. client_name)
			or nil
	end,
	format = function(client_messages)
		if #client_messages > 0 then
			return table.concat(client_messages, "  ")
		end
		return ""
	end,
})

-- Listens lsp-progress event and refresh lualine.
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
	group = "lualine_augroup",
	pattern = "LspProgressStatusUpdated",
	callback = require("lualine").refresh,
})
