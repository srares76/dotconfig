-- require('nvim-ts-autotag').setup()
-- require("nvim-autopairs").setup {
--     disable_filetype = { "TelescopePrompt", "vim" },
-- }

local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
    return
end

autopairs.setup {
    disable_filetype = { "TelescopePrompt", "vim" },
}

-- local status2, ts_autotag = pcall(require, "nvim-ts-autotag")
-- if not status2 then
--     return
-- ends
--

require('nvim-ts-autotag').setup()
