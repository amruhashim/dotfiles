local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
	vim.notify("flutter-tools not found!")
	return
end

flutter_tools.setup({
	-- LSP configuration
	lsp = {
		on_attach = function(client, bufnr)
			print("Flutter LSP attached")
			-- Use your existing LSP keybinds - they'll work automatically
		end,
		capabilities = function(config)
			-- Add any custom capabilities here if needed
			return config
		end,
		settings = {
			showTodos = true,
			completeFunctionCalls = true,
		},
	},

	-- Flutter development features (set to true if you want them)
	debugger = { enabled = false },
	dev_log = { enabled = true },
	dev_tools = { autostart = false },

	-- UI preferences
	outline = { auto_open = false },
	widget_guides = { enabled = false },
	closing_tags = { enabled = false },

	-- Flutter/Dart paths (usually auto-detected)
	flutter_path = nil, -- Auto-detect
	flutter_lookup_cmd = nil, -- Auto-lookup
	fvm = false, -- Set to true if using Flutter Version Management

	-- Project detection
	root_patterns = { ".git", "pubspec.yaml" },
})
