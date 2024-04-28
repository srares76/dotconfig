local harpoon = require("harpoon")

harpoon:setup({
    settings = {
        save_on_toggle = true,
    },
})

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader><leader>a", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

local function goAndCloseTree(num)
    vim.cmd("NvimTreeClose")
    harpoon:list():select(num)
end


vim.keymap.set("n", "<leader>1", function() goAndCloseTree(1) end)
vim.keymap.set("n", "<leader>2", function() goAndCloseTree(2) end)
vim.keymap.set("n", "<leader>3", function() goAndCloseTree(3) end)
vim.keymap.set("n", "<leader>4", function() goAndCloseTree(4) end)
vim.keymap.set("n", "<leader>5", function() goAndCloseTree(5) end)
