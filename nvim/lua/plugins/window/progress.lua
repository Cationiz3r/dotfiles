require('lsp-progress').setup({
	spinner = {
		"", -- EE06
		"", -- EE07
		"", -- EE08
		"", -- EE09
		"", -- EE0A
		"", -- EE0B
	},
	decay = 200,
	series_format = function(title, message, percentage, done)
		if type(title) ~= "string" or string.len(title) == 0 then
			return nil
		end

		local builder = {}
		local escaped_title = title:gsub("%%", "%%%%")
		table.insert(builder, escaped_title)

		if done then
			table.insert(builder, " ") -- E92B
		elseif percentage then
			table.insert(builder, string.format("%.0f%%%%", percentage))
		end

		if type(message) == "string" and string.len(message) > 0 then
			local msg = vim.fn.strdisplaywidth(message) > 20
				and vim.fn.strpart(message, 0, 17) .. "..."
				or message
			local escaped_msg = msg:gsub("%%", "%%%%")
			table.insert(builder, "\"" .. escaped_msg .. "\"")
		end
		return table.concat(builder, " ")
	end,
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
