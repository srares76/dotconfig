vim.g.mapleader = " "
vim.g.wordmotion_prefix = "<leader>"
vim.keymap.set("n", "<leader>x", vim.cmd.Ex)

-- Move rows
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Life improvements
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "Q", "<nop>")

-- Copy Paste
vim.keymap.set({ "n", "v" }, "y", [["+y]])
vim.keymap.set({ "n", "v" }, "d", [["+d]])
vim.keymap.set({ "n", "v" }, "c", [["+c]])
vim.keymap.set({ "n", "v" }, "s", [["+s]])
vim.keymap.set({ "n", "v" }, "x", [["+x]])
vim.keymap.set("n", "D", [["+D]])
vim.keymap.set("n", "C", [["+C]])
vim.keymap.set("n", "S", [["+S]])
vim.keymap.set("n", "dd", [["_dd]])
vim.keymap.set({ "n", "v" }, "p", [["+pgvy]])

-- Save File
vim.keymap.set("n", "<leader>s", function()
    local status, prettier = pcall(require, "prettier")
    if status then
        prettier.format()
    end
    vim.cmd("w")
end)

vim.keymap.set("n", "<leader>F", function()
    vim.lsp.buf.format()
    vim.cmd("w")
end)



-- Navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- String Replace All
vim.keymap.set("n", "<leader><leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Select Entire File
vim.keymap.set("n", "<D-a>", "GVgg")

-- Undo/Redo
vim.keymap.set("n", "<D-z>", "u")

-- Select all
vim.keymap.set("n", "<M-a>", "gg<S-v>G")

vim.keymap.set("i", "<Esc>", "<C-c>")
