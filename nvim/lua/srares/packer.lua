local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        "williamboman/mason.nvim"
    }

    use {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd('colorscheme tokyonight')
        end

    }

    use { "folke/noice.nvim",
        opts = function(_, opts)
            opts.presets.lsp_doc_border = true
        end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require('telescope').setup {
                defaults = {
                    path_display = { 'shorten' },
                }
            }
        end
    }

    -- -- Github Theme
    -- use({
    --     'projekt0n/github-nvim-theme',
    --     config = function()
    --         require('github-theme').setup({
    --             -- ...
    --         })

    --         vim.cmd('colorscheme github_dark')
    --     end
    -- })

    use('nvim-tree/nvim-tree.lua')
    use('kyazdani42/nvim-web-devicons')

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- Harpoon
    use('theprimeagen/harpoon')

    -- Fugitive (Git)
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')

    -- CamelCaseMotion
    use('bkad/CamelCaseMotion')

    -- LuaLine
    use('hoob3rt/lualine.nvim')

    -- Surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use("nvim-treesitter/nvim-treesitter-context");
    use("nvim-treesitter/nvim-treesitter-context");

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
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
            { 'rafamadriz/friendly-snippets' }
        }
    }

    -- Prettier
    use("jose-elias-alvarez/null-ls.nvim")
    use("MunifTanjim/prettier.nvim")

    -- Copilot
    use("github/copilot.vim")

    -- Commentary
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Auto Pairs
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use("windwp/nvim-ts-autotag")

    -- Test Runner
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/nvim-nio",
            "nvim-neotest/neotest-jest",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    }

    use("echasnovski/mini.hipatterns")

    use("itchyny/vim-cursorword")

    use("OmniSharp/omnisharp-vim")

    use("jose-elias-alvarez/typescript.nvim")

    use("luochen1990/rainbow")

    use({
        'glepnir/lspsaga.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('lspsaga').setup({})
        end,
    })

    if packer_bootstrap then
        require('packer').sync()
    end
end)
