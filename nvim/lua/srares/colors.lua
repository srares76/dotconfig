function ApplyColors()
    -- vim.cmd([[highlight clear Normal]])
    -- vim.cmd([[highlight clear NormalFloat]])
    vim.cmd([[highlight Comment guifg=#00FF00]])
    vim.cmd([[highlight LineNr guifg=#FFFF00 ctermfg=yellow]])
end

-- Apply colors when colorscheme is loaded
vim.cmd([[autocmd ColorScheme * lua ApplyColors()]])
