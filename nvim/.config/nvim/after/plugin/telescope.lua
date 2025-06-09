local builtin = require('telescope.builtin')

require('telescope').setup({
    extensions = {
        fzf = {}
    }
})

require('telescope').load_extension('fzf')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>C-p', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>ep', function()
    builtin.find_files({
        cwd = vim.fn.stdpath('data') .. '/packer',
        prompt_title = 'Edit Packages'
    })
end, { desc = 'Search plugin files' })

vim.keymap.set('n', '<leader>ph', function()
    builtin.find_files({ hidden = true })
end, { desc = 'Find files (including hidden)' })

vim.keymap.set('n', '<leader>pd', function()
    builtin.find_files({
        find_command = { 'fd', '--type', 'd' },
        prompt_title = 'Find Directories'
    })
end, { desc = 'Find directories' })

vim.keymap.set('n', '<leader>pD', function()
    builtin.find_files({
        find_command = { 'fd', '--type', 'd', '--hidden' },
        prompt_title = 'Find Directories (Hidden)'
    })
end, { desc = 'Find directories (including hidden)' })
