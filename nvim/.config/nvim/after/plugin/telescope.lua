local builtin = require('telescope.builtin')

-- Setup telescope with fzf-native
require('telescope').setup({
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
    builtin.grep_string({search=vim.fn.input("Grep > ")}); 
end)

-- Package search keymap
vim.keymap.set('n', '<leader>ep', function()
  builtin.find_files({
    cwd = vim.fn.stdpath('data') .. '/packer',  -- change to '/lazy' if using lazy.nvim
    prompt_title = 'Edit Packages'
  })
end, { desc = 'Search plugin files' })

-- Find files including hidden
vim.keymap.set('n', '<leader>ph', function()
  builtin.find_files({ hidden = true })
end, { desc = 'Find files (including hidden)' })

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
end, { desc = 'Find directories (including hidden)' })