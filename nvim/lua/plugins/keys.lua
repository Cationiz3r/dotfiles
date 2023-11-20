vim.opt.timeout = true
vim.opt.timeoutlen = 400

local register = require("core.keymaps").register

local telescope = require("telescope.builtin")
local gitsigns = package.loaded.gitsigns
local illuminate = require("illuminate")
local snip = require("luasnip")
local todo = require("todo-comments")
local utils = require("core.utils")

local function diagnostics(severity, next)
	local severities = {
		Error = vim.diagnostic.severity.ERROR,
		Warn = vim.diagnostic.severity.WARN,
	}
	local func = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	return function()
		func({ severity = severities[severity] })
	end
end

-- Normal mode
register({
	["<a-e>"] = ":NvimTreeFocus<CR>",

	["<S-Tab>"] = "<cmd>BufferLineCyclePrev<CR>",
	["<Tab>"] = "<cmd>BufferLineCycleNext<CR>",

	["["] = {
		c = gitsigns.prev_hunk,
		e = diagnostics("Error"),
		r = illuminate.goto_prev_reference,
		s = function() snip.jump(-1) end,
		t = todo.jump_prev,
		w = diagnostics("Warn"),
	},
	["]"] = {
		c = gitsigns.next_hunk,
		e = diagnostics("Error", true),
		r = illuminate.goto_next_reference,
		s = function() snip.jump(1) end,
		t = todo.jump_next,
		w = diagnostics("Warn", true),
	},

	["<leader>"] = {
		f = {
			S = telescope.lsp_workspace_symbols,
			d = telescope.live_grep,
			e = function() telescope.diagnostics({ no_sign = true }) end,
			f = telescope.find_files,
			h = telescope.help_tags,
			q = telescope.quickfix,
			r = telescope.lsp_references,
			s = telescope.lsp_document_symbols,
			t = "<cmd>TodoTelescope keywords=TODO,FIX,TEST,DEBUG<CR>",
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

		h = {
			C = telescope.git_commits,
			c = telescope.git_bcommits,
			b = telescope.git_branches,
			s = telescope.git_status,
			z = telescope.git_stash,
		},

		l = {
			D = vim.lsp.buf.declaration,
			a = vim.lsp.buf.code_action,
			d = vim.lsp.buf.definition,
			i = vim.lsp.buf.implementation,
			r = vim.lsp.buf.rename,
			t = vim.lsp.buf.type_definition,
		},

		o = telescope.oldfiles,

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
				vim.cmd "MasonToolsUpdate"
				vim.cmd "TSUpdateSync"
			end,
		}
	},

	K = vim.lsp.buf.hover,
	q = utils.close_buffer,
})

-- Visual mode
register({
	S = ":s/\\v",

	["<leader>"] = {
		g = {
			s = function() gitsigns.stage_hunk(utils.visual_range()) end,
			r = function() gitsigns.reset_hunk(utils.visual_range()) end,
		},
	},
}, { mode = "v" })
