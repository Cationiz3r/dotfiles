require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then return "]c" end
			vim.schedule(function() gs.next_hunk() end)
			return "<Ignore>"
		end, {expr=true})

		map("n", "[c", function()
			if vim.wo.diff then return "[c" end
			vim.schedule(function() gs.prev_hunk() end)
			return "<Ignore>"
		end, {expr=true})

		-- Actions
		map({ "n", "v" }, "gs", ":Gitsigns stage_hunk<CR>")
		map({ "n", "v" }, "gr", ":Gitsigns reset_hunk<CR>")
		map("n", "gS", gs.stage_buffer)
		map("n", "gu", gs.undo_stage_hunk)
		map("n", "gR", gs.reset_buffer)
		map("n", "gp", gs.preview_hunk)
	end
})

-- Update nvimtree
vim.api.nvim_create_autocmd("User", {
	pattern = "GitSignsUpdate",
	callback = require("nvim-tree.api").tree.reload,
})
