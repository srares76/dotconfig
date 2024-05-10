local builtin = require('telescope.builtin') -- Format File
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('v', '<leader>fm', builtin.grep_string, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

require('telescope').load_extension('fzf')
