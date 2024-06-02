function ApplyColors()
    vim.cmd([[highlight clear Normal]])
    vim.cmd([[highlight clear NormalFloat]])
    vim.cmd([[highlight Comment guifg=#00FF00]])
    vim.cmd([[highlight LineNr guifg=#FFFF00 ctermfg=yellow]])
    vim.cmd([[highlight Normal guibg=none]])
    vim.cmd([[highlight SignColumn guibg=none]])
end

-- Apply colors when colorscheme is loaded
vim.cmd([[autocmd ColorScheme * lua ApplyColors()]])
vim.cmd [[colorscheme github_dark]]

-- This shouldn't be here but I'm too lazy to make a separate file for it
vim.cmd [[Copilot disable]]
