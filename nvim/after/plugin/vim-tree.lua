-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable nvim-tree from opening automatically
vim.g.nvim_tree_auto_open = 0

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
    -- change folder arrow icons
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "⬇", -- arrow when folder is closed
                    arrow_open = "➨", -- arrow when folder is open
                },
            },
        },
    },
    view = {
        width = 50,
        preserve_window_proportions = false,
    },
    ui = {
        confirm = {
            default_yes = true,
        }
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})

vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
