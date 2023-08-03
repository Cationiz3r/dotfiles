local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
		vim.cmd [[ packadd packer.nvim ]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	-- Editor
	use { "nvim-tree/nvim-tree.lua", commit = "9c97e6449b0b0269bd44e1fd4857184dfa57bb4c" }
	use "nvim-lualine/lualine.nvim"
	use "lewis6991/gitsigns.nvim"
	use "nvim-treesitter/nvim-treesitter"
	use { "nvim-telescope/telescope.nvim", tag = "0.1.1" }
	use	"nvim-lua/plenary.nvim"
	use { "akinsho/bufferline.nvim", tag = "v3.*" }
	use "nvim-tree/nvim-web-devicons"
	use "numToStr/Comment.nvim"
	use "windwp/nvim-autopairs"
	use "RRethy/vim-illuminate"
	use "norcalli/nvim-colorizer.lua"
	use { "Mofiqul/dracula.nvim", commit = "26d04c8" }
	use "lukas-reineke/indent-blankline.nvim"
	use { "kylechui/nvim-surround", tag = "*" }

	-- Mason
	use "williamboman/mason.nvim"
	use "WhoIsSethDaniel/mason-tool-installer.nvim"
	use "neovim/nvim-lspconfig"
	use "mfussenegger/nvim-lint" -- lint
	use "mhartington/formatter.nvim" -- formatter

	-- Completion
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"
	use "rafamadriz/friendly-snippets" -- Extra snippets
	use "onsails/lspkind.nvim"
	use "uga-rosa/cmp-dictionary"

	-- Keymaps
	use "folke/which-key.nvim"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
