vim.opt.timeout = true
vim.opt.timeoutlen = 400

local whichkey = require("which-key")
local telescope = require("telescope.builtin")
local gitsigns = package.loaded.gitsigns
local illuminate = require("illuminate")
local snip = require("luasnip")
local utils = require("core.utils")

-- Quick (no leader)
whichkey.register({
	-- vim.keymap.set("n", "e", require("core.utils").close_buffer)
	["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<CR>", "previous buffer" },
	["<Tab>"] = { "<cmd>BufferLineCycleNext<CR>", "next buffer" },
	["<a-e>"] = { ":NvimTreeFocus<CR>", "tree" },
	["<a-z>"] = { "<c-w><", "minus width" },
	["<a-c>"] = { "<c-w>>", "add width" },
	q = { utils.close_buffer, "buffer" },
	s = { "<cmd>:w<CR>", "save buffer" },
	K = { vim.lsp.buf.hover, "hover" },

	["["] = {
		name = "+previous",
		c = { gitsigns.prev_hunk, "hunk" },
		r = { illuminate.goto_prev_reference, "reference" },
		s = { function() snip.jump(-1) end, "selection" },
	},
	["]"] = {
		name = "+next",
		c = { gitsigns.next_hunk, "hunk" },
		r = { illuminate.goto_next_reference, "reference" },
		s = { function() snip.jump(1) end, "selection" },
	},
})

-- Normal mode
whichkey.register({
	r = { "<cmd>source %<CR>", "source current" },
	h = { "<cmd>nohl<CR>", "no highlight" },

	q = {
		name = "+quit",
		q = { "<cmd>wqa<CR>", "all" },
		d = { "<cmd>qa!<CR>", "delete" },
		w = {"<cmd>q<CR>", "window"},
		W = {"<cmd>wincmd o<CR>", "all other windows"},
		b = { utils.close_buffer, "buffer" },
		B = { "<cmd>BufOnly!<CR>", "all other buffers" },
		t = { "<cmd>NvimTreeClose<CR>", "tree" }
	},

	s = {
		name = "+show",
		d = {
			function()
				require("gitsigns.actions").diffthis()
				vim.cmd("windo set foldcolumn=0")
			end,
			"git diff"
		},
		i = { vim.lsp.buf.signature_help, "signature_help" },
		r = { vim.lsp.buf.references, "references" },
	},

	f = {
		name = "+find",
		f = { "<cmd>NvimTreeFindFile<CR>", "file in tree" },
		d = { telescope.live_grep, "in directory" },
		w = { telescope.grep_string, "word" },
		s = { telescope.lsp_document_symbols, "document symbols" },
		S = { telescope.lsp_workspace_symbols, "workspace symbols" },
		q = { telescope.quickfix, "in quickfix list" },
		h = { telescope.help_tags, "in help" },
		r = { telescope.lsp_references, "references" },
	},

	g = {
		name = "+git",
		s = { gitsigns.stage_hunk, "stage hunk" },
		S = { gitsigns.stage_buffer, "stage buffer" },
		r = { gitsigns.reset_hunk, "reset hunk" },
		R = { gitsigns.reset_buffer, "reset buffer" },
		u = { gitsigns.undo_stage_hunk, "undo" },
		p = { gitsigns.preview_hunk, "preview" },
	},

	o = {
		name = "+open",
		t = { ":NvimTreeFocus<CR>", "tree" },
		f = { telescope.find_files, "file" },
		r = { telescope.oldfiles, "recent" },
		b = { telescope.buffers, "buffer" },
		p = { "<cmd>Telescope project<CR>", "project" },
		gb = { telescope.git_branches, "git branch" },
		gc = { telescope.git_commits, "git commit" },
	},

	l = {
		name = "+lsp",
		D = { vim.lsp.buf.declaration, "declaration" },
		d = { vim.lsp.buf.definition, "definition" },
		i = { vim.lsp.buf.implementation, "implementation" },
		t = { vim.lsp.buf.type_definition, "type definition" },
		a = { vim.lsp.buf.code_action, "code action" },
		r = { vim.lsp.buf.rename, "rename" },
	},
}, { prefix = "<leader>" })

-- Visual
whichkey.register({
	g = {
		name = "+git",
		s = { function()
			gitsigns.stage_hunk(utils.visual_range())
		end, "stage hunk" },
		r = { function()
			gitsigns.reset_hunk(utils.visual_range())
		end, "stage hunk" },
	},
}, { prefix = "<leader>", mode = "v" })
