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

require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	"nvim-tree/nvim-web-devicons",

	"rebelot/kanagawa.nvim",

	-- Treesitter: Advanced syntax highlighting and code understanding
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	-- Treesitter playground: View and debug treesitter syntax trees
	"nvim-treesitter/playground",

	"stevearc/conform.nvim",

	"nvim-lua/plenary.nvim",
	"theprimeagen/harpoon",
	"mbbill/undotree",

	"tpope/vim-fugitive",

	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		priority = 900,
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	{
		"nvzone/typr",
		dependencies = "nvzone/volt",
		config = function()
			require("typr").setup({})
		end,
		cmd = { "Typr", "TyprStats" },
	},

	-- Moved off GitHub; upstream is Codeberg now.
	{ url = "https://codeberg.org/andyg/leap.nvim" },

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

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

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
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

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

	{
		"b0o/schemastore.nvim",
		lazy = true,
		ft = { "json", "jsonc" },
	},

	-- Smear cursor: animated cursor trail, replacing kitty's `cursor_trail`
	{
		"sphamba/smear-cursor.nvim",
		event = "VeryLazy",
		opts = {
			cursor_color = "#C8C093", -- kanagawa wave oldWhite

			-- Lower = longer trail. Insert mode stays stiffer so it doesn't
			-- lag behind fast typing.
			stiffness = 0.8,
			trailing_stiffness = 0.5,
			stiffness_insert_mode = 0.6,
			trailing_stiffness_insert_mode = 0.6,
			distance_stop_animating = 0.5,

			-- Needs a font with legacy computing symbols; JetBrains Mono and
			-- Victor Mono don't have them, so use the block-character renderer.
			legacy_computing_symbols_support = false,

			smear_between_buffers = true,
			smear_between_neighbor_lines = true,
		},
	},
})
