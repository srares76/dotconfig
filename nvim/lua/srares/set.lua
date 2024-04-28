vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 49

vim.opt.clipboard:append('unnamedplus')

vim.api.nvim_create_autocmd('InsertEnter',  {
    callback= function()
        vim.opt.relativenumber = false
    end,
})
vim.api.nvim_create_autocmd('InsertLeavePre',  {
    callback= function()
        vim.opt.relativenumber = true
    end,
})
