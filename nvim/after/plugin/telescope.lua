local builtin = require("telescope.builtin")
local live_grep_args = require("telescope").extensions.live_grep_args
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

vim.keymap.set("v", "<leader>fs", live_grep_args_shortcuts.grep_visual_selection)
vim.keymap.set("n", "<leader>fs", live_grep_args.live_grep_args)
vim.keymap.set("n", "<leader>fm", Live_multigrep, {})
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>p", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("v", "<leader>fm", builtin.grep_string, {})
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")
