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

map("n", "<leader>qd", ":qa!<CR>")
map("n", "<leader>qq", ":wqa<CR>")
map("n", "s", ":w<CR>")
map("n", "<leader>h", ":noh<CR>")
map("n", "<leader>r", ":source %<CR>")
map("n", "U", "<c-r>")

-- Alt prefix
map("n", "<a-q>", "<cmd>qa!<CR>")
map("n", "<a-a>", "<c-w>h")
map("n", "<a-s>", "<c-w>j")
map("n", "<a-w>", "<c-w>k")
map("n", "<a-d>", "<c-w>l")
map("n", "<a-r>", "<cmd>vs<CR>")
map("n", "<a-v>", "<cmd>sp<CR>")
map("n", "<a-f>", "<cmd>silent wincmd o<CR>")
