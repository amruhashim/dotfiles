-- Basic Neovim Configuration
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>e', ':Explore<CR>')
vim.keymap.set('i', 'jk', '<Esc>')

print("Neovim config loaded!")
