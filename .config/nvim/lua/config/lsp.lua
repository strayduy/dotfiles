-- Enable language servers
vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        -- Enable LSP completion
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            -- Completion options:
            -- https://neovim.io/doc/user/options.html#'completeopt'
            vim.opt.completeopt = { "menu", "menuone", "noselect" }
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end

        -- Set up keymaps for LSP-related actions
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = ev.buf,
                silent = true,
                desc = desc,
            })
        end

        -- Rename the symbol under your cursor.
        map("n", "<Leader>rn", vim.lsp.buf.rename, "[R]e[n]ame symbol")

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map({ "n", "x" }, "<Leader>ca", vim.lsp.buf.code_action, "See available [C]ode [A]ctions")

        map("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic")
    end,
})

vim.diagnostic.config({
    virtual_lines = true,
})
