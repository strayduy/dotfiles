return {
    "WilliamHsieh/overlook.nvim",
    opts = {},
    keys = {
        {
            "<Leader>pd",
            function()
                require("overlook.api").peek_definition()
            end,
            desc = "[P]eek [D]efinition",
        },
        {
            "<Leader>ps",
            function()
                require("overlook.api").open_in_vsplit()
            end,
            desc = "[P]opup open in [S]plit",
        },
        {
            "<Leader>po",
            function()
                require("overlook.api").open_in_vsplit()
            end,
            desc = "[P]opup [O]pen in current window",
        },
        {
            "<Leader>pq",
            function()
                require("overlook.api").close_all()
            end,
            desc = "[P]opup [Q]uit all",
        },
    },
}
