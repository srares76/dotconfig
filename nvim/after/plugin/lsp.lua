local lsp = require("lsp-zero")

require("mason").setup()

lsp.preset("recommended")

vim.keymap.set("n", "<leader>mi", [[:Mason<CR>]])

lsp.ensure_installed({ 'ts_ls', 'tailwindcss', 'lua_ls' })

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

---@diagnostic disable-next-line: lowercase-global
function import_missing()
    local params = {
        command = "TypescriptAddMissingImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
    }
    vim.lsp.buf.execute_command(params)
    vim.cmd("w")
end

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-j>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

local function on_attach(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>rr", "<cmd>Telescope lsp_references<CR>", opts)
    vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", opts)
end

lsp.on_attach(on_attach)

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['tsserver'] = { 'javascript', 'typescript' },
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- Global LSP client capabilities to disable showing source information
local global_capabilities = vim.lsp.protocol.make_client_capabilities()
---@diagnostic disable-next-line: inject-field
global_capabilities.textDocument.diagnostic.show_source = false

-- Example configurations for specific LSP servers
local lspconfig = require('lspconfig')
lspconfig.tailwindcss.setup {}
lspconfig.sourcekit.setup {
    capabilities = global_capabilities,
    on_attach = on_attach
}

lspconfig.groovyls.setup {}
lspconfig.ts_ls.setup({
    capabilities = global_capabilities, -- Apply global capabilities
    on_attach = function(client, _)
        client.server_capabilities.document_formatting = true
        client.server_capabilities.document_range_formatting = false
        on_attach()
    end,
    handlers = {
        -- Handle definition to go directly to source definition
        ["textDocument/definition"] = function(err, result, ...)
            result = vim.tbl_islist(result) and result[1] or result
            vim.lsp.handlers["textDocument/definition"](err, result, ...)
        end,
    },
    commands = {
        OrganizeImports = {
            organize_imports,
            description = "Organize Imports"
        },
        ImportMissing = {
            import_missing,
            description = "Import missing"
        }
    }
})

-- Additional key mappings
vim.keymap.set("n", "<leader>fo", "<cmd>lua organize_imports()<CR>")
vim.keymap.set("n", "<leader>fi", "<cmd>:ImportMissing<CR>")
