return {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = "default",

            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-y>"] = { "accept", "fallback" },
        },

        -- Don't preselect first completion item
        completion = { list = { selection = { preselect = false } } },

        signature = { enabled = true },

        sources = {
            default = { "lsp", "snippets", "buffer", "path" },
        },
    },
    opts_extend = { "sources.default" },
}
