-- nvim-treesitter (`main` branch rewrite). This plugin now only installs
-- parsers/queries; highlighting and folds are provided by Neovim core.
-- Requires the `tree-sitter` CLI (installed via mise) and a C compiler.
local parsers = {
    "bash",
    "css",
    "dockerfile",
    "gitignore",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "prisma",
    "python",
    "query",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false, -- does not support lazy-loading
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")
            ts.install(parsers) -- async; no-op for already-installed parsers

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
                callback = function(ev)
                    -- Only start if a parser is available for this filetype
                    if not pcall(vim.treesitter.start, ev.buf) then
                        return
                    end
                    -- Experimental treesitter-based indentation
                    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })

            -- Incremental selection is built into Neovim 0.12: in visual mode,
            -- `an` selects the parent node and `in` the child node. These keep
            -- the old <C-space> / <BS> muscle memory.
            vim.keymap.set("n", "<C-space>", "van", { remap = true, desc = "Start treesitter selection" })
            vim.keymap.set("x", "<C-space>", "an", { remap = true, desc = "Expand treesitter selection" })
            vim.keymap.set("x", "<BS>", "in", { remap = true, desc = "Shrink treesitter selection" })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
}
