return {
    {
        "zbirenbaum/copilot.lua",
        requires = {
            "copilotlsp-nvim/copilot-lsp",
        },
        event = "VeryLazy",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = false,
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    keymap = {
                        accept = "<C-y>",
                        next = "<C-j>",
                        prev = "<C-k>",
                        dismiss = "<C-e>",
                    },
                },
                filetypes = {
                    javascript = true,
                    lua = true,
                    python = true,
                    sh = true,
                    typescript = true,
                    typescriptreact = true,
                },
            })
        end,
    },
}
