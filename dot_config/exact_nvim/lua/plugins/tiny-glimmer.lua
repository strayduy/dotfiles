return {
    "rachartier/tiny-glimmer.nvim",
    event = "VeryLazy",
    priority = 10, -- Needs to be a really low priority, to catch others plugins keybindings.
    opts = {
        overwrite = {
            yank = {
                default_animation = "pulse",
            },
            paste = {
                default_animation = "pulse",
            },
            undo = {
                enabled = true,

                default_animation = {
                    name = "pulse",
                    settings = {
                        from_color = "DiffDelete",
                    },
                },
                undo_mapping = "u",
            },
            redo = {
                enabled = true,

                default_animation = {
                    name = "pulse",
                    settings = {
                        from_color = "DiffAdd",
                    },
                },

                redo_mapping = "<c-r>",
            },
        },
        animations = {
            pulse = {
                pulse_count = 1,
                from_color = "Search",
                to_color = "Normal",
            },
        },
    },
}
