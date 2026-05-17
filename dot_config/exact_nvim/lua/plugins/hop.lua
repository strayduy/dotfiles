return {
    "smoka7/hop.nvim",
    config = function()
        local hop = require("hop")
        hop.setup({})

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<Leader><Leader>", "<CMD>HopWord<CR>", { desc = "Hop to a word" })
    end,
}
