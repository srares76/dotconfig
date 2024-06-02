return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            rename = {
                auto_save = true
            }
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}

