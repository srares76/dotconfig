return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            outline = {
                highlight = 'LspSagaTSClass',
                close_after_jump = true,
                auto_close = true
            }
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    }
}
