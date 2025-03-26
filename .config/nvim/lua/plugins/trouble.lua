return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        focus = true,
    },
    cmd = "Trouble",
    keys = {
        { "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble [W]orkspace diagnostics" },
        {
            "<leader>xd",
            "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
            desc = "Open trouble [D]ocument diagnostics",
        },
        { "<leader>xq", "<cmd>Trouble [Q]uickfix toggle<CR>", desc = "Open trouble quickfix list" },
        { "<leader>xl", "<cmd>Trouble [L]oclist toggle<CR>", desc = "Open trouble location list" },
        { "<leader>xt", "<cmd>Trouble [T]odo toggle<CR>", desc = "Open todos in trouble" },
    },
}
