return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "marilari88/neotest-vitest",
            "nvim-neotest/neotest-plenary",
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-jest"),
                    require("neotest-plenary").setup({
                        -- this is my standard location for minimal vim rc
                        -- in all my projects
                        min_init = "./scripts/tests/minimal.vim",
                    }),
                },
                output = {
                    enabled = true,
                    open_on_run = "short"
                },
                output_panel = {
                    enabled = true,
                    open = "botright split | resize 15",
                    open_on_run = true
                },
            })

            vim.keymap.set("n", "<leader>tc", function()
                neotest.output_panel.clear()
                neotest.run.run()
            end)
            vim.keymap.set("n", "<leader>tf", function()
                neotest.output_panel.clear()
                neotest.run.run(vim.fn.expand("%")) -- Run File
            end)
            vim.keymap.set("n", "<leader>ta", function()
                neotest.output_panel.clear()
                neotest.run.run(vim.loop.cwd()) -- Run All Test Files
            end)
            vim.keymap.set("n", "<leader>tl", function()
                neotest.output_panel.clear()
                neotest.run.run_last() -- Run Last
            end)
            vim.keymap.set("n", "<leader>ts", function()
                neotest.summary.toggle() -- Toggle Summary
            end)
            vim.keymap.set("n", "<leader>tO", function()
                neotest.output_panel.toggle() -- Toggle Output Panel
            end)
            vim.keymap.set("n", "<leader>to", function()
                neotest.output.open()
            end)
            vim.keymap.set("n", "<leader>tx", function()
                neotest.run.stop() -- Stop
            end)
            vim.keymap.set("n", "<leader>t0", function()
                neotest.output_panel.clear() -- Clear Output Panel
            end)
        end,
    },
}
