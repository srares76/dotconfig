local builtin = require('telescope.builtin')
-- Format File
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set('n', '<leader><leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>p', builtin.git_files, {})
vim.keymap.set('n', '<leader>F', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

local actions = require('telescope.actions')
require('telescope').setup {
    shorten_path = true,
}
