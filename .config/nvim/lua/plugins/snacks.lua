return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        dashboard = { example = "advanced" },
        indent = { char = "┊", scope = { char = "┊" } },
        notifier = { enabled = true },
        picker = {
            layout = {
                preset = "sidebar",
                layout = {
                    width = 60,
                    min_width = 60,
                },
            },
        },
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
        {
            "<Leader>gB",
            function()
                Snacks.gitbrowse()
            end,
            desc = "[G]it [B]rowse",
            mode = { "n", "v" },
        },
        -- picker
        {
            "<Leader>ff",
            function()
                Snacks.picker.files()
            end,
            desc = "[F]ind [F]iles in cwd",
        },
        {
            "<Leader>fs",
            function()
                Snacks.picker.grep()
            end,
            desc = "[F]ind [S]tring in cwd",
        },
        {
            "<Leader>fc",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "[F]ind string under [C]ursor in cwd",
        },
        {
            "<Leader>fb",
            function()
                Snacks.picker.buffers()
            end,
            desc = "[F]ind file within [B]uffer",
        },
        {
            "<Leader>fr",
            function()
                Snacks.picker.recent()
            end,
            desc = "[F]ind [R]ecent files",
        },
        -- lsp
        {
            "gd",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "[g]oto [d]efinition",
        },
        {
            "gR",
            function()
                Snacks.picker.lsp_references()
            end,
            desc = "[g]oto [R]eferences",
        },
    },
}
