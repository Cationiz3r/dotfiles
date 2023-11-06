-- This should include plugins-independent keybindings
local M = {}
M.register = function(mappings, opts)
	opts = opts or {}
	opts = {
		mode = opts.mode or "n",
		prefix = opts.prefix or "",
	}

	if type(mappings) == "table" then
		for k, v in pairs(mappings) do
			M.register(v, {
				mode = opts.mode,
				prefix = opts.prefix .. k,
			})
		end
	else
		vim.keymap.set(opts.mode, opts.prefix, mappings)
	end
end

M.register({
	-- Jump
	["<PageUp>"] = "30k",
	["<PageDown>"] = "30j",
	["<c-Up>"] = "10k",
	["<c-Down>"] = "10j",
	["<s-Up>"] = "3k",
	["<s-Down>"] = "3j",
	["<Home>"] = "^",
	["<End>"] = "$",

	-- Move to window
	["<a-w>"] = "<c-w>k",
	["<a-a>"] = "<c-w>h",
	["<a-s>"] = "<c-w>j",
	["<a-d>"] = "<c-w>l",

	-- Change window width
	["<a-z>"] = "<c-w><",
	["<a-c>"] = "<c-w>>",

	-- Split window
	["<a-r>"] = "<cmd>vs<CR>",
	["<a-v>"] = "<cmd>sp<CR>",

	["<a-f>"] = "<cmd>silent wincmd o<CR>",
	["<a-q>"] = "<cmd>qa!<CR>",
	["<leader>"] = {
		h = "<cmd>noh<CR>",
		q = {
			d = "<cmd>qa!<CR>",
			q = "<cmd>wqa<CR>",
		},
		r = "<cmd>:source %<CR>",
	},
	U = "<c-r>",
	S = ":%s/\\v",
	s = "<cmd>:w<CR>",
})

M.register({
	-- Jump
	["<PageUp>"] = "30k",
	["<PageDown>"] = "30j",
	["<c-Up>"] = "10k",
	["<c-Down>"] = "10j",
	["<s-Up>"] = "3k",
	["<s-Down>"] = "3j",
	["<Home>"] = "^",
	["<End>"] = "$",

	S = ":s/\\v",
}, { mode = "v" })

M.register({
	p = "P",
}, { mode = "x" })

return M
