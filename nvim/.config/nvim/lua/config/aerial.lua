-- ~/.config/nvim/lua/config/aerial.lua

require("aerial").setup({
	-- Priority list of preferred backends for aerial
	backends = {
		javascript = { "lsp", "treesitter" }, -- Use LSP first for JavaScript
		["*"] = { "treesitter", "lsp", "markdown", "asciidoc", "man" }, -- Default for other filetypes
	},

	layout = {
		max_width = { 40, 0.2 },
		width = nil,
		min_width = 10,
		default_direction = "prefer_right",
		placement = "window",
		resize_to_content = true,
		preserve_equality = false,
	},

	-- Show detailed symbols including variables and parameters
	filter_kind = {
		"Array",
		"Boolean",
		"Class",
		"Constant",
		"Constructor",
		"Enum",
		"EnumMember",
		"Event",
		"Field",
		"Function",
		"Interface",
		"Key",
		"Method",
		"Module",
		"Namespace",
		"Null",
		"Number",
		"Object",
		"Operator",
		"Package",
		"Property",
		"String",
		"Struct",
		"TypeParameter",
		"Variable",
		"Trait",
		"Macro",
		"Static",
	},

	-- Highlight settings
	highlight_mode = "split_width",
	highlight_closest = true,
	highlight_on_hover = false,
	highlight_on_jump = 300,

	-- Use nerd font icons
	nerd_font = "auto",

	-- Show guides for tree hierarchy
	show_guides = true,

	-- Buffer-local keymaps when aerial attaches
	on_attach = function(bufnr)
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Aerial: Previous symbol" })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Aerial: Next symbol" })
	end,

	-- Additional options
	close_automatic_events = {},
	manage_folds = false,
	link_folds_to_tree = false,
	link_tree_to_folds = true,
})

-- Command abbreviations for easier access
vim.cmd("cnoreabbrev at AerialToggle")
vim.cmd("cnoreabbrev ao AerialOpen")
vim.cmd("cnoreabbrev ac AerialClose")
vim.cmd("cnoreabbrev atr AerialToggle right")
vim.cmd("cnoreabbrev atl AerialToggle left")
