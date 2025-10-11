local lsp_zero = require("lsp-zero")

-- Setup Mason and LSP servers
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"eslint",
		"lua_ls",
		"rust_analyzer",
		"jsonls",
		"sqls",
	},
	handlers = {
		lsp_zero.default_setup,

		-- TypeScript/JavaScript with auto-imports
		ts_ls = function()
			require("lspconfig").ts_ls.setup({
				settings = {
					typescript = {
						includePackageJsonAutoImports = "auto",
						suggest = {
							includeCompletionsForModuleExports = true,
							includeAutomaticOptionalChainCompletions = true,
						},
						preferences = {
							includePackageJsonAutoImports = "auto",
						},
					},
					javascript = {
						suggest = {
							includeCompletionsForModuleExports = true,
							includeAutomaticOptionalChainCompletions = true,
						},
						preferences = {
							includePackageJsonAutoImports = "auto",
						},
					},
				},
			})
		end,

		-- Lua with Neovim API support
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,

		-- JSON with schema validation
		jsonls = function()
			require("lspconfig").jsonls.setup({
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
		end,

		-- PostgreSQL
		sqls = function()
			require("lspconfig").sqls.setup({
				settings = {
					sqls = {
						connections = {
							{
								driver = "postgresql",
								dataSourceName = "host=127.0.0.1 port=5432 user=postgres password=yourpassword dbname=yourdb sslmode=disable",
							},
						},
					},
				},
			})
		end,
	},
})

-- Diagnostic signs and display
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

-- LSP keymaps
lsp_zero.on_attach(function(client, bufnr)
	print("LSP attached: " .. client.name)
	local opts = { buffer = bufnr, remap = false }

	-- Navigation
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)

	-- Diagnostics
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)

	-- Code actions
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)

	-- Flutter-specific keymaps
	if client.name == "dartls" then
		vim.keymap.set("n", "<leader>fr", "<cmd>FlutterRun<cr>", opts)
		vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<cr>", opts)
		vim.keymap.set("n", "<leader>frl", "<cmd>FlutterReload<cr>", opts)
		vim.keymap.set("n", "<leader>fR", "<cmd>FlutterRestart<cr>", opts)
		vim.keymap.set("n", "<leader>fd", "<cmd>FlutterDevices<cr>", opts)
		vim.keymap.set("n", "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", opts)
	end
end)

-- Autocompletion setup
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
})
