local neogit = require('neogit')

neogit.setup {
    disable_commit_confirmation = true,
    disable_context_highlighting = true,
    disable_signs = true,
    telescope_sorter = function()
        return require("telescope").extensions.fzf.native_fzf_sorter()
    end,
    integrations = {
        telescope = true,
        diffview = true
    },
    max_process_buffer_lines = 30000,
    preview_buffer = {
        kind = "split",
    },
    kind = "tab"
}

vim.keymap.set("n", "gs", function()
    neogit.open({ kind = "vsplit" })
end)

vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>",
    { silent = true, noremap = true }
)

vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>",
    { silent = true, noremap = true }
)

vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>",
    { silent = true, noremap = true }
)

vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>",
    { silent = true, noremap = true }
)
