vim.opt.timeout = true
vim.opt.timeoutlen = 400

local register = require("core.keymaps").register

local telescope = require("telescope.builtin")
local gitsigns = package.loaded.gitsigns
local illuminate = require("illuminate")
local snip = require("luasnip")
local utils = require("core.utils")

-- Normal mode
register({
	["<a-e>"] = ":NvimTreeFocus<CR>",

	["<S-Tab>"] = "<cmd>BufferLineCyclePrev<CR>",
	["<Tab>"] = "<cmd>BufferLineCycleNext<CR>",

	["["] = {
		c = gitsigns.prev_hunk,
		r = illuminate.goto_prev_reference,
		s = function() snip.jump(-1) end,
	},
	["]"] = {
		c = gitsigns.next_hunk,
		r = illuminate.goto_next_reference,
		s = function() snip.jump(1) end,
	},

	["<leader>"] = {
		f = {
			S = telescope.lsp_workspace_symbols,
			d = telescope.live_grep,
			f = "<cmd>NvimTreeFindFile<CR>",
			h = telescope.help_tags,
			q = telescope.quickfix,
			r = telescope.lsp_references,
			s = telescope.lsp_document_symbols,
			w = telescope.grep_string,
		},

		g = {
			R = gitsigns.reset_buffer,
			S = gitsigns.stage_buffer,
			b = gitsigns.blame_lines,
			p = gitsigns.preview_hunk,
			r = gitsigns.reset_hunk,
			s = gitsigns.stage_hunk,
			u = gitsigns.undo_stage_hunk,
		},

		l = {
			D = vim.lsp.buf.declaration,
			a = vim.lsp.buf.code_action,
			d = vim.lsp.buf.definition,
			i = vim.lsp.buf.implementation,
			r = vim.lsp.buf.rename,
			t = vim.lsp.buf.type_definition,
		},

		o = {
			b = telescope.buffers,
			f = "<cmd>Telescope find_files find_command=fd,-u,-tf<CR>",
			g = {
				b = telescope.git_branches,
				c = telescope.git_commits,
			},
			p = "<cmd>Telescope project<CR>",
			r = telescope.oldfiles,
		},

		q = {
			B = "<cmd>BufOnly!<CR>",
			W = "<cmd>wincmd o<CR>",
			w = "<cmd>q<CR>",
		},

		u = {
			m = "<cmd>MasonToolsUpdate<CR>",
			p = "<cmd>PackerSync<CR>",
			t = "<cmd>TSUpdateSync<CR>",
			u = function()
				vim.cmd "PackerSync"
				vim.cmd "MasonToolsUpdate<CR>"
				vim.cmd "TSUpdateSync"
			end,
		}
	},

	K = vim.lsp.buf.hover,
	q = utils.close_buffer,
})

-- Visual mode
register({
	g = {
		s = function() gitsigns.stage_hunk(utils.visual_range()) end,
		r = function() gitsigns.reset_hunk(utils.visual_range()) end,
	},
}, { prefix = "<leader>", mode = "v" })
