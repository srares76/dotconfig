return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-jest",
            "nvim-neotest/neotest-plenary",
        },
        config = function()
            local neotest = require("neotest")

            vim.keymap.set("n", "<leader>n", function()
                local jestConfigPath = vim.fn.getcwd() .. '/jest.config.js'
                if vim.fn.filereadable(jestConfigPath) == 1 then
                    return jestConfigPath
                end
                local current_buffer_path = vim.api.nvim_buf_get_name(0)
                local split_path = vim.split(current_buffer_path, "/")
                local packages_index = 0
                local package_name

                for i, part in ipairs(split_path) do
                    if part:find("packages") then
                        packages_index = i
                        break
                    end
                end

                if packages_index and split_path[packages_index + 1] then
                    package_name = split_path[packages_index + 1]
                else
                    package_name = nil
                end
                local final_path = vim.fn.getcwd() .. "/packages/" .. package_name .. '/jest.config.js'
                return final_path
            end)

            neotest.setup({
                adapters = {
                    require("neotest-go")({
                        experimental = {
                            test_table = true,
                        },
                        args = { "-count=1", "-timeout=60s" },
                        recursive_run = true
                    }),

                    require("neotest-jest")({
                        jestCommand = "yarn test",
                        jestConfigFile = function(file)
                            if string.find(file, "/packages/") then
                                local current_buffer_path = vim.api.nvim_buf_get_name(0)
                                local split_path = vim.split(current_buffer_path, "/")
                                local packages_index = 0
                                local package_name

                                for i, part in ipairs(split_path) do
                                    if part:find("packages") then
                                        packages_index = i
                                        break
                                    end
                                end

                                if packages_index and split_path[packages_index + 1] then
                                    package_name = split_path[packages_index + 1]
                                else
                                    package_name = nil
                                end
                                local final_path = vim.fn.getcwd() .. "/packages/" .. package_name .. '/jest.config.js'
                                print(string.find(file, "/packages/.-/"))
                                return final_path
                            end

                            return vim.fn.getcwd() .. "/jest.config.js"
                        end,
                        cwd = function(file)
                            if string.find(file, "/packages/") then
                                return string.match(file, "(.-/[^/]+/)src")
                            end
                            return vim.fn.getcwd()
                        end
                    }),
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
                neotest.run.stop()
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
