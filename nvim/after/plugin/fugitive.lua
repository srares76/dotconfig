vim.keymap.set("n", "<leader>gs", function ()
    vim.cmd("vertical Git")
end)

vim.keymap.set("n", "<leader>gds", function ()
    vim.cmd("Gvdiffsplit")
end)
