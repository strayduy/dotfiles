return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "cssls",
                "graphql",
                "html",
                "lua_ls",
                "prismals",
                "pyright",
                "ts_ls",
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "black", -- python formatter
                -- Pin eslint_d to a specific version to avoid this issue:
                -- https://github.com/mfussenegger/nvim-lint/issues/462#issuecomment-2504521215
                { "eslint_d", version = "13.1.2" }, -- js linter
                "isort", -- python formatter
                "prettier", -- prettier formatter
                "pylint", -- python linter
                "stylua", -- lua formatter
            },
        })
    end,
}
