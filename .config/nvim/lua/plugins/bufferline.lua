return {
    "akinsho/bufferline.nvim",
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                nvim_diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
                separator_style = "slant",
            },
        })

        vim.keymap.set("n", "[b", ":bp<CR>", { desc = "Go to previous buffer" })
        vim.keymap.set("n", "]b", ":bn<CR>", { desc = "Go to next buffer" })
    end,
}
