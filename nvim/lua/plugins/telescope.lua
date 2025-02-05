return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            version = "^1.0.0",
        },
    },
    config = function()
        local telescope = require "telescope"
        local actions = require "telescope.actions"
        local pickers = require "telescope.pickers"
        local finders = require "telescope.finders"
        local make_entry = require "telescope.make_entry"
        local conf = require "telescope.config".values
        local lga_actions = require "telescope-live-grep-args.actions"

        Live_multigrep = function(opts)
            opts = opts or {}
            ---@diagnostic disable-next-line: undefined-field
            opts.cwd = opts.cwd or vim.uv.cwd()

            local finder = finders.new_async_job {
                command_generator = function(prompt)
                    if not prompt or prompt == "" then
                        return nil
                    end

                    local pieces = vim.split(prompt, "  ")
                    local args = { "rg" }
                    if pieces[1] then
                        table.insert(args, "-e")
                        table.insert(args, pieces[1])
                    end

                    if pieces[2] then
                        table.insert(args, "-g")
                        table.insert(args, pieces[2])
                    end

                    return vim.tbl_flatten {
                        args,
                        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" }
                    }
                end,
                entry_maker = make_entry.gen_from_vimgrep(opts),
                cwd = opts.cwd
            }

            pickers.new(opts, {
                prompt_title = "Multi Grep",
                finder = finder,
                previewer = conf.grep_previewer(opts),
                sorter = require("telescope.sorters").empty(),
            }):find()
        end

        telescope.setup {
            defaults = {
                prompt_prefix = " ",
                mappings = {
                    i = {
                        ["<leader>k"] = actions.cycle_history_prev,
                        ["<leader>j"] = actions.cycle_history_next
                    }
                }
            },
            pickers = {
                lsp_references = {
                    fname_width = 70
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
