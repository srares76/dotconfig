local builtin = require('telescope.builtin')
-- Format File
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

local actions = require('telescope.actions')
require('telescope').setup {
    shorten_path = true,
}
