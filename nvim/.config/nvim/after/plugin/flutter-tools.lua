local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
    vim.notify("flutter-tools not found!")
    return
end

local lsp_zero = require("lsp-zero")
local capabilities = lsp_zero.get_capabilities()

flutter_tools.setup({
    lsp = {
        on_attach = function(client, bufnr)
            print("Flutter LSP attached")
        end,
        capabilities = capabilities,
        settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
        },
    },
    debugger = { enabled = false },
    dev_log = {
        enabled = true,
        open_cmd = "tabedit",
    },
    dev_tools = { autostart = false },
    outline = { auto_open = false },
    widget_guides = { enabled = true },
    closing_tags = {
        highlight = "Comment",
        prefix = "// ",
        enabled = true
    },
    flutter_path = nil,
    flutter_lookup_cmd = nil,
    fvm = false,
    root_patterns = { ".git", "pubspec.yaml" },
})
