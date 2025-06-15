local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
    vim.notify("flutter-tools not found!")
    return
end

-- Get the LSP capabilities from your existing setup
local lsp_zero = require("lsp-zero")
local capabilities = lsp_zero.get_capabilities()

flutter_tools.setup({
    -- LSP configuration
    lsp = {
        on_attach = function(client, bufnr)
            print("Flutter LSP attached")
            -- This will use your existing keybinds from lsp.lua
        end,
        capabilities = capabilities, -- Use the capabilities from lsp-zero
        settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
        },
    },
    -- Flutter development features
    debugger = { enabled = false },
    dev_log = {
        enabled = true,
        open_cmd = "tabedit", -- Open logs in new tab
    },
    dev_tools = { autostart = false },
    -- UI preferences
    outline = { auto_open = false },
    widget_guides = { enabled = true }, -- Enable widget guides for better Flutter dev
    closing_tags = {
        highlight = "Comment",
        prefix = "// ",
        enabled = true
    },
    -- Flutter/Dart paths (usually auto-detected)
    flutter_path = nil,    -- Auto-detect
    flutter_lookup_cmd = nil, -- Auto-lookup
    fvm = false,           -- Set to true if using Flutter Version Management
    -- Project detection
    root_patterns = { ".git", "pubspec.yaml" },
})
