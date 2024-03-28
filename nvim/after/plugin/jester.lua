local status, jester = pcall(require, "jester")
if not status then
    return
end

vim.keymap.set("n", "<leader>tt", function() jester.run() end)
vim.keymap.set("n", "<leader>tf", function() jester.run_file() end)
