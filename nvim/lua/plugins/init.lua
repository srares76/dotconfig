return {
    "williamboman/mason.nvim",

    -- File Tree
    'nvim-tree/nvim-tree.lua',
    'kyazdani42/nvim-web-devicons',

    -- Fugitive (Git)
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',

    -- LuaLine
    'hoob3rt/lualine.nvim',

    -- Surround
    {
        'tpope/vim-surround.nvim',
        url = 'https://github.com/tpope/vim-surround'
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'f3fora/cmp-spell' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    -- Prettier
    "jose-elias-alvarez/null-ls.nvim",
    "MunifTanjim/prettier.nvim",

    -- Commentary
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    -- Auto Pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    },

    -- Test Runner
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-neotest/neotest-jest",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    },

    --[[ Rares_HelloThereTesting :)  ]]

    "windwp/nvim-ts-autotag",
    "theprimeagen/harpoon",
    "echasnovski/mini.hipatterns",
    "itchyny/vim-cursorword",
    "jose-elias-alvarez/typescript.nvim",
    "luochen1990/rainbow",
    "github/copilot.vim",
    "luochen1990/rainbow",
    "chaoren/vim-wordmotion",
}
