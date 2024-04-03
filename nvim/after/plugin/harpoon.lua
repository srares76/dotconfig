local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader><leader>a", ui.toggle_quick_menu)

local function goAndCloseTree(num)
  vim.cmd("NvimTreeClose")
  ui.nav_file(num)
end

vim.keymap.set("n", "<leader>1", function() goAndCloseTree(1) end)
vim.keymap.set("n", "<leader>2", function() goAndCloseTree(2) end)
vim.keymap.set("n", "<leader>3", function() goAndCloseTree(3) end)
vim.keymap.set("n", "<leader>4", function() goAndCloseTree(4) end)
