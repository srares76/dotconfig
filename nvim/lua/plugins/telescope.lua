return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    -- or                            , branch = '0.1.x',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            version = "^1.0.0",
        },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local lga_actions = require("telescope-live-grep-args.actions")

        vim.keymap.set("n", "<leader>n", function()
            Pprint(actions)
        end)

        telescope.setup {
            defaults = {
                prompt_prefix = " ",
                mappings = {
                    i = {
                        ["<leader><Up>"] = actions.cycle_history_prev,
                        ["<leader><Down>"] = actions.cycle_history_next
                    }
                }
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "ignore_case",
                },
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt({ postfix = " -F " }),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                }
            }
        }
    end
}
