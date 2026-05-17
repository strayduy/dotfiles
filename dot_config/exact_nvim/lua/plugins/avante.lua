return {
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = function()
        return "make"
    end,
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
        provider = "copilot",
        providers = {
            copilot = {
                model = "claude-sonnet-4.5",
            },
        },
        mappings = {
            submit = {
                insert = "<C-y>",
            },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "folke/snacks.nvim",
    },
}
