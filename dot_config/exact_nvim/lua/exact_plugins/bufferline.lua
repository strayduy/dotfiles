return {
    "akinsho/bufferline.nvim",
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                nvim_diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "snacks_layout_box", -- snacks explorer sidebar
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
                separator_style = "slant",
            },
        })
    end,
}
