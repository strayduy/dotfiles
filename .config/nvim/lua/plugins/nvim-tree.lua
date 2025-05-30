return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            view = {
                width = 35,
                relativenumber = true,
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "", -- arrow when folder is open
                        },
                    },
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            },
        })

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<Leader>ee", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file [E]xplorer" })
        keymap.set(
            "n",
            "<Leader>ef",
            "<CMD>NvimTreeFindFileToggle<CR>",
            { desc = "Toggle file [E]xplorer on current [F]ile" }
        )
        keymap.set("n", "<Leader>eq", "<CMD>NvimTreeCollapse<CR>", { desc = "File [E]xplorer [Q]uit" })
        keymap.set("n", "<Leader>er", "<CMD>NvimTreeRefresh<CR>", { desc = "File [E]xplorer [R]efresh" })
    end,
}
