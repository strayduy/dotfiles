return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        dashboard = {
            -- Based on snacks' "advanced" example, minus the `colorscript` and git status sections
            sections = {
                { section = "header" },
                -- Invisible spacer in the right pane, as tall as the header (+2
                -- padding added by the header section), so both panes line up.
                function(self)
                    local height = #vim.split(self.opts.preset.header, "\n") + 2
                    return { pane = 2, text = "", padding = height - 1 }
                end,
                { section = "keys", gap = 1, padding = 1 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                { section = "startup" },
            },
        },
        explorer = { enabled = true }, -- also replaces netrw
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
        words = { enabled = true },
    },
    keys = {
        -- file explorer
        {
            "<Leader>ee",
            function()
                Snacks.explorer()
            end,
            desc = "Toggle file [E]xplorer",
        },
        {
            "<Leader>ef",
            function()
                Snacks.explorer.reveal()
            end,
            desc = "Reveal current [F]ile in file [E]xplorer",
        },
        {
            "<Leader>eq",
            function()
                local explorer = Snacks.picker.get({ source = "explorer" })[1]
                if explorer then
                    explorer:close()
                end
            end,
            desc = "File [E]xplorer [Q]uit",
        },
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
