require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "javascript", "typescript", "sql", "css", "markdown", "markdown_inline" },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
    }
}
