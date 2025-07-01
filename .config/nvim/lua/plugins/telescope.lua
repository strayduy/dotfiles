return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<Leader>ff", "<CMD>Telescope find_files<CR>", { desc = "[F]ind [F]iles in cwd" })
        keymap.set("n", "<Leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "[F]ind [R]ecent files" })
        keymap.set("n", "<Leader>fs", "<CMD>Telescope live_grep<CR>", { desc = "[F]ind [S]tring in cwd" })
        keymap.set("n", "<Leader>fb", "<CMD>Telescope buffers<CR>", { desc = "[F]ind file within [B]uffer" })
        keymap.set(
            "n",
            "<Leader>fc",
            "<CMD>Telescope grep_string<CR>",
            { desc = "[F]ind string under [C]ursor in cwd" }
        )
    end,
}
