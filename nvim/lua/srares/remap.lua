vim.g.mapleader = " "
vim.g.wordmotion_prefix = "<leader>"

-- Move rows
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Life improvements
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "z<space>", "<cmd>only<CR>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-1>", "<cmd>lua print(\"hello\")<CR>")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "Q", "<nop>")

-- Buffer management
vim.keymap.set("n", "dd", [["_dd]])
vim.keymap.set({ "v" }, "p", [["+pgvy]], { noremap = true })

-- Navigation
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Delete keymap
vim.keymap.set("n", "<C-z>", function() end)
vim.keymap.set("n", "<F1>", function() end)

-- String Replace All
vim.keymap.set("n", "<leader><leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Delete all lines containing string
vim.keymap.set("n", "<leader>ra", [[:%g/\<<C-r><C-w>\>/d<Left><Left><Left><Left>]])

vim.keymap.set("i", "<Esc>", "<C-c>")

-- Snippets
vim.keymap.set("n", "<leader>jl", "oconsole.log()<Left>\"\"<Left>here<Right>, ") -- js console.log
vim.keymap.set("n", "<leader>jcl", function()
    local content = vim.fn.getreg("+")                                           -- get clipboard content
    local log_statement = 'console.log("here ' .. content .. '", ' .. content .. ');'

    -- move to the next line and enter insert mode
    vim.api.nvim_feedkeys("o" .. log_statement, "n", false)
end, { desc = "Type console.log with clipboard content" })
