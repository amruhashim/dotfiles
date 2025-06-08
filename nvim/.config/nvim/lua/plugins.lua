vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Telescope with dependencies
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" }, -- File icons
		},
	})

	-- Telescope FZF native for better performance
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	-- File icons (can be used by other plugins too)
	use("nvim-tree/nvim-web-devicons")

	use("rebelot/kanagawa.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")
	use("stevearc/conform.nvim")
	use("nvim-lua/plenary.nvim")
	use("theprimeagen/harpoon")
	use("mbbill/undotree") 
	use("tpope/vim-fugitive")

