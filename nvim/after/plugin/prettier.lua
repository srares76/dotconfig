local status, prettier = pcall(require, "prettier")
if not status then
    return
end

prettier.setup {
    -- prettier options here
    bin = "prettierd",
    filetypes = {
        "javascript",
        "typescript",
        "typescriptreact",
        "javascriptreact",
        "css",
        "scss",
        "json",
        "graphql",
        "markdown",
        "yaml",
        "html",
        "svelte",
        "python",
        "lua",
        "javascript.jsx",
        "typescript.tsx"
    }
}
