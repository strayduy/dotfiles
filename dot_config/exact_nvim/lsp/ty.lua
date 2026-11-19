local root_markers = { "ty.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" }

return {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    -- Always provide a workspace root. Without one, ty falls back to nvim's
    -- cwd as its workspace and silently skips diagnostics for files outside
    -- it (e.g. a scratch file in /tmp). Use the project root if found,
    -- otherwise the file's own directory.
    root_dir = function(bufnr, on_dir)
        on_dir(vim.fs.root(bufnr, root_markers) or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
    end,
}
