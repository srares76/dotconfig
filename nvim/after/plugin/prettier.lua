local status, prettier = pcall(require, "prettier")
if not status then
    return
end

prettier.setup {
    bin = "prettierd",
    tab_width = 4,
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
        "python",
        "lua",
        "javascript.jsx",
        "typescript.tsx"
    }
}

local function get_extension(filename)
    return filename:match("^.+%.([^.]+)$")
end

vim.keymap.set("n", "<leader>s", function()
    local currentFileName = vim.fn.expand("%:t")
    local file_extension = get_extension(currentFileName)
    if (file_extension == "js") then
        prettier.format()
    else
        vim.lsp.buf.format()
    end
    vim.cmd("wa")
end)
