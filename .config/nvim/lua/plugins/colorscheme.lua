return {
    {
        "folke/tokyonight.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("tokyonight").setup({
                style = "night",
                on_colors = function() end,
                on_highlights = function() end,
            })
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
}
