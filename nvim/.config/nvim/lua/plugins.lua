vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    -- Telescope with dependencies
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-tree/nvim-web-devicons" }, -- File icons
        },
    })
    -- Telescope FZF native for better performance
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })
    -- File icons (can be used by other plugins too)
    use("nvim-tree/nvim-web-devicons")
    use("rebelot/kanagawa.nvim")
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("nvim-treesitter/playground")
    use("stevearc/conform.nvim")
    use("nvim-lua/plenary.nvim")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    })
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })
    use({
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons'
    })
    use {
        'nvzone/typr',
        requires = 'nvzone/volt',
        config = function()
            require('typr').setup({})
        end,
        cmd = { 'Typr', 'TyprStats' }
    }
    use('ggandor/leap.nvim')
    use({
        'stevearc/oil.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('oil').setup({
                view_options = {
                    show_hidden = true,
                }
            })
        end
    })
    use({
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    })
end)
