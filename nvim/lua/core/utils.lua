local count_bufs_by_type = function(loaded_only)
	loaded_only = (loaded_only == nil and true or loaded_only)
	local count = {
		normal = 0,
		acwrite = 0,
		help = 0,
		nofile = 0,
		nowrite = 0,
		quickfix = 0,
		terminal = 0,
		prompt = 0,
	}
	local buftypes = vim.api.nvim_list_bufs()
	for _, bufname in pairs(buftypes) do
		if (not loaded_only) or vim.api.nvim_buf_is_loaded(bufname) then
			local buftype = vim.api.nvim_buf_get_option(bufname, "buftype")
			buftype = buftype ~= "" and buftype or "normal"
			count[buftype] = count[buftype] + 1
		end
	end
	return count
end

local M = {}
M.close_buffer = function()
	local bufTable = count_bufs_by_type()
	if (bufTable.normal <= 1) then
		vim.api.nvim_exec([[:qa]], false)
	else
		vim.api.nvim_exec([[:bp|sp|bn|bd"]], false)
	end
end

M.visual_range = function()
	return { vim.fn.line("."), vim.fn.line("v") }
end

return M
