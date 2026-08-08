-- ============================================================================
-- Lazy.nvim Bootstrap
-- ============================================================================
-- Install lazy.nvim package manager if not already installed

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- Plugin Setup
-- ============================================================================

require("lazy").setup({
	-- ------------------------------------------------------------------------
	-- Fuzzy Finder
	-- ------------------------------------------------------------------------
	-- Telescope: Highly extensible fuzzy finder over lists
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
	-- FZF native extension for telescope (faster sorting)
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	-- ------------------------------------------------------------------------
	-- UI/Icons
	-- ------------------------------------------------------------------------
	-- Web devicons for file type icons
	"nvim-tree/nvim-web-devicons",

	-- ------------------------------------------------------------------------
	-- Colorscheme
	-- ------------------------------------------------------------------------
	-- Kanagawa: Dark theme inspired by Japanese paintings
	"rebelot/kanagawa.nvim",

	-- ------------------------------------------------------------------------
	-- Syntax Highlighting & Parsing
	-- ------------------------------------------------------------------------
	-- Treesitter: Advanced syntax highlighting and code understanding
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	-- Treesitter playground: View and debug treesitter syntax trees
	"nvim-treesitter/playground",

	-- ------------------------------------------------------------------------
	-- Code Formatting
	-- ------------------------------------------------------------------------
	-- Conform: Formatter plugin
	"stevearc/conform.nvim",

	-- ------------------------------------------------------------------------
	-- Utilities
	-- ------------------------------------------------------------------------
	-- Plenary: Utility functions for lua plugins
	"nvim-lua/plenary.nvim",
	-- Harpoon: Quick file navigation
	"theprimeagen/harpoon",
	-- Undotree: Visual undo history
	"mbbill/undotree",

	-- ------------------------------------------------------------------------
	-- Git Integration
	-- ------------------------------------------------------------------------
	-- Fugitive: Git wrapper
	"tpope/vim-fugitive",

	-- ------------------------------------------------------------------------
	-- LSP & Completion
	-- ------------------------------------------------------------------------
	-- LSP Zero: LSP configuration framework
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP configuration
			"neovim/nvim-lspconfig",
			-- Mason: LSP server manager
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- Completion engine
			"hrsh7th/nvim-cmp",
			-- Completion sources
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			-- Snippet engine
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	},

	-- ------------------------------------------------------------------------
	-- Statusline
	-- ------------------------------------------------------------------------
	-- Lualine: Fast and customizable statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- ------------------------------------------------------------------------
	-- Git Signs
	-- ------------------------------------------------------------------------
	-- Git signs: Show git diff in sign column
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		priority = 900,
	},

	-- ------------------------------------------------------------------------
	-- Buffer Management
	-- ------------------------------------------------------------------------
	-- Bufferline: VSCode-like buffer tabs
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- ------------------------------------------------------------------------
	-- Typing Practice
	-- ------------------------------------------------------------------------
	-- Typr: In-editor typing practice
	{
		"nvzone/typr",
		dependencies = "nvzone/volt",
		config = function()
			require("typr").setup({})
		end,
		cmd = { "Typr", "TyprStats" },
	},

	-- ------------------------------------------------------------------------
	-- Motion/Navigation
	-- ------------------------------------------------------------------------
	-- Leap: Enhanced motion plugin for quick jumping
	-- Moved off GitHub; upstream is Codeberg now.
	{ url = "https://codeberg.org/andyg/leap.nvim" },

	-- ------------------------------------------------------------------------
	-- File Manager
	-- ------------------------------------------------------------------------
	-- Oil: Edit filesystem like a buffer
	{
		"stevearc/oil.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("oil").setup({
				view_options = {
					show_hidden = true,
				},
			})
		end,
	},

	-- ------------------------------------------------------------------------
	-- Comment Management
	-- ------------------------------------------------------------------------
	-- Comment: Smart commenting plugin
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- ------------------------------------------------------------------------
	-- UI Enhancements
	-- ------------------------------------------------------------------------
	-- Noice: Experimental UI replacement for messages, cmdline and popupmenu
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				views = {
					cmdline_popup = {
						border = {
							style = "double",
							padding = { 1, 1 },
						},
						filter_options = {},
						win_options = {
							winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
						},
					},
				},
			})
		end,
	},

	-- ------------------------------------------------------------------------
	-- Auto Pairs & Tags
	-- ------------------------------------------------------------------------
	-- Autopairs: Automatic bracket/quote pairing
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string" },
					javascript = { "template_string" },
					dart = { "string" },
					java = false,
				},
			})
			-- Integration with nvim-cmp
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	-- Auto-tag: Automatic HTML/JSX tag closing and renaming
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	-- ------------------------------------------------------------------------
	-- Language Support: Flutter/Dart
	-- ------------------------------------------------------------------------
	-- Flutter Tools: Flutter development tools integration
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- ------------------------------------------------------------------------
	-- Session Management
	-- ------------------------------------------------------------------------
	-- Auto-session: Automatic session management
	{
		"rmagatti/auto-session",
		lazy = false,
		---enables autocomplete for opts
		---@module "auto-session"
		---@type AutoSession.Config
		opts = {
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			-- log_level = 'debug',
		},
	},

	-- ------------------------------------------------------------------------
	-- Code Outline
	-- ------------------------------------------------------------------------
	-- Aerial: Code outline window for navigation
	{
		"stevearc/aerial.nvim",
		-- master now requires Neovim 0.12+. Pin to the 0.11 maintenance branch
		-- until we upgrade; drop this line after moving to 0.12.
		branch = "nvim-0.11",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("config.aerial")
		end,
	},

	-- ------------------------------------------------------------------------
	-- JSON Schema Support
	-- ------------------------------------------------------------------------
	-- SchemaStore: JSON schema validation for package.json, tsconfig.json, etc.
	{
		"b0o/schemastore.nvim",
		lazy = true,
		ft = { "json", "jsonc" },
	},
})
