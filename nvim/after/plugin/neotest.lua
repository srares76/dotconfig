require("neotest").setup({
    adapters = {
        require("neotest-jest"),
    },
})

vim.keymap.set("n", "<leader>tf", "<cmd>require(\"neotest\").run.run()<CR>zz")
