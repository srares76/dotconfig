return {
    "adalessa/laravel.nvim",
    dependencies = {
        "tpope/vim-dotenv",
        "nvim-telescope/telescope.nvim",
        "MunifTanjim/nui.nvim",
        "kevinhwang91/promise-async",
    },
    cmd = { "Laravel" },
    keys = {
        { "<leader>lam", ":Laravel make<cr>" },
        { "<leader>lar", ":Laravel routes<cr>" },
    },
    event = { "VeryLazy" },
    opts = {
        features = {
            route_info = {
                enable = true,  --- to enable the laravel.nvim virtual text
                view = "right", --- where to show the info (available options 'right', 'top')
            },
        },
    },
    config = true
}
