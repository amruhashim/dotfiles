local status_ok, conform = pcall(require, "conform")
if not status_ok then
	vim.notify("conform not found!")
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		rust = { "rustfmt" },
		go = { "gofmt" },
		c = { "clang_format" },
		cpp = { "clang_format" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- Manual format keybinding (same as before)
vim.keymap.set("n", "<leader>f", function()
	conform.format({ timeout_ms = 500, lsp_fallback = true })
end, {})

