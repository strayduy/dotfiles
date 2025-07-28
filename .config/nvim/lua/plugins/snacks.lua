return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        dashboard = { example = "advanced" },
        indent = { char = "┊", scope = { char = "┊" } },
        lazygit = { enabled = true },
        notifier = { enabled = true },
    },
    keys = {
        {
            "<Leader>lg",
            function()
                Snacks.lazygit()
            end,
            desc = "Open [L]azy[G]it",
        },
        {
            "<Leader>t",
            function()
                Snacks.terminal()
            end,
            desc = "Open [T]erminal",
        },
    },
}
