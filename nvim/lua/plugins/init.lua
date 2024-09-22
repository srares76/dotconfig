return {
    "williamboman/mason.nvim",
    {
        "sainnhe/sonokai",
        priority = 1000,
        config = function()
            vim.g.sonokai_transparent_background = 2
            vim.g.enable_italic = 1
            vim.g.sonokai_float_style = "dim"
            vim.g.sonokai_style = "andromeda"
            vim.g.sonokai_diagnostic_virtual_text = "colored"
            vim.cmd("colorscheme sonokai")
        end
    },

    -- File Tree
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',

    -- Undo tree
    'mbbill/undotree',

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

    {
        'glepnir/lspsaga.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require("lspsaga").setup(
                {
                    ui = {
                        border = "rounded",
                        colors = {
                            normal_bg = "#282828"
                        }
                    },
                    lightbulb = {
                        enable = false
                    },
                    symbol_in_winbar = {
                        enable = false,
                        separator = "  ",
                        hide_keyword = true,
                        show_file = true,
                        folder_level = 2,
                        respect_root = false,
                        color_mode = true
                    },
                    rename = {
                        in_select = false
                    },
                    diagnostic = {
                        show_code_action = false,
                        keys = {
                            quit = { "q", "<Esc>" },
                        },
                    },
                    beacon = {
                        enable = false
                    }
                }
            )

            -- get color by name
            local function get_hl_color(group, attr)
                return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
            end

            local function set_hl(name)
                -- get lspsaga highlights to list
                local highlights = vim.api.nvim_exec("filter " .. name .. " highlight", true)

                -- loop highlight
                for s in highlights:gmatch("[^\r\n]+") do
                    -- split by first space
                    local hl = s:find(" ") or (#s + 1)
                    hl = s:sub(1, hl - 1)
                    -- get fg color for highlight
                    local fg = get_hl_color(hl, "fg#")
                    -- skip empty hl
                    if hl == "" then
                        goto continue
                    end

                    local string = ""
                    if fg == "" then
                        string = "hi " .. hl .. " guisp=#665c54 gui=underline guibg=#313131"
                    else
                        string = "hi " .. hl .. " guisp=#665c54 gui=underline guibg=#313131 guifg=" .. fg
                    end

                    vim.cmd(string)
                    ::continue::
                end
            end

            set_hl("SagaWinbar")
        end,
    },

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
            "nvim-neotest/neotest-go",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    },

    "windwp/nvim-ts-autotag",
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "echasnovski/mini.hipatterns",
    "itchyny/vim-cursorword",
    "luochen1990/rainbow",
    "chaoren/vim-wordmotion",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- Git integration
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = true
    },
    'lewis6991/gitsigns.nvim',
    'mg979/vim-visual-multi',
}
