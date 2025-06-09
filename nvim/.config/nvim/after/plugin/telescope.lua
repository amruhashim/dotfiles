local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

-- Setup telescope with fzf-native and custom mappings
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                -- Insert mode navigation (for when typing/filtering)
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["<Tab>"] = actions.move_selection_next,
                ["<S-Tab>"] = actions.move_selection_previous,
                -- Disable the problematic ones
                ["<C-j>"] = false,
                ["<C-k>"] = false,
            },
            n = {
                -- Normal mode navigation (j/k work here!)
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,
                -- Switch back to insert mode for filtering
                ["i"] = function() vim.cmd("startinsert") end,
                ["a"] = function() vim.cmd("startinsert!") end,
            },
        },
    },
    extensions = {
        fzf = {}
    }
})

-- Load the extension
require('telescope').load_extension('fzf')

-- Your existing keymaps
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>C-p', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Package search keymap
vim.keymap.set('n', '<leader>ep', function()
    builtin.find_files({
        cwd = vim.fn.stdpath('data') .. '/lazy',
        prompt_title = 'Edit Packages'
    })
end, { desc = 'Search plugin files' })

-- Find files including hidden
vim.keymap.set('n', '<leader>ph', function()
    builtin.find_files({ hidden = true })
end, { desc = 'Find files including hidden' })

-- Find directories only
vim.keymap.set('n', '<leader>pd', function()
    builtin.find_files({
        find_command = { 'fd', '--type', 'd' },
        prompt_title = 'Find Directories'
    })
end, { desc = 'Find directories' })

-- Find directories including hidden
vim.keymap.set('n', '<leader>pD', function()
    builtin.find_files({
        find_command = { 'fd', '--type', 'd', '--hidden' },
        prompt_title = 'Find Directories (Hidden)'
    })
end, { desc = 'Find directories including hidden' })

-- Diagnostics keymaps
vim.keymap.set('n', '<leader>pe', builtin.diagnostics, { desc = 'Project errors' })
vim.keymap.set('n', '<leader>fe', function()
    builtin.diagnostics({ bufnr = 0 })
end, { desc = 'File errors' })
