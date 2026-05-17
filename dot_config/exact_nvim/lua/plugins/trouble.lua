return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        focus = true,
    },
    cmd = "Trouble",
    keys = {
        { "<Leader>Tw", "<CMD>Trouble diagnostics toggle<CR>", desc = "[T]rouble [W]orkspace diagnostics" },
        {
            "<Leader>Td",
            "<CMD>Trouble diagnostics toggle filter.buf=0<CR>",
            desc = "[T]rouble [D]ocument diagnostics",
        },
        { "<Leader>Tq", "<CMD>Trouble [Q]uickfix toggle<CR>", desc = "[T]rouble [Q]uickfix list" },
        { "<Leader>Tl", "<CMD>Trouble [L]oclist toggle<CR>", desc = "[T]rouble [L]ocation list" },
        { "<Leader>Tt", "<CMD>Trouble [T]odo toggle<CR>", desc = "[T]rouble [T]odos" },
    },
}
