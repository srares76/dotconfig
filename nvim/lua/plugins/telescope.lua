return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
        require('telescope').setup {
            defaults = {
                path_display = { 'shorten' },
                prompt_prefix = " "
            },
            extensions = {
                fzf = {
                    fuzzy = true,     -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "ignore_case", -- or "ignore_case" or "respect_case"
                }                     -- the default case_mode is "smart_case"                }
            }
        }
    end
}
