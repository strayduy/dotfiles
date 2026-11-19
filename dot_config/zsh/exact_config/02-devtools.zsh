# Shell integrations for CLI dev tools. Must load after 00-mise.zsh, since
# some of these (e.g. atuin) are installed via mise and aren't on PATH until
# mise is activated.

eval "$(starship init zsh)"

eval "$(zoxide init zsh --cmd j)"

# atuin: SQLite-backed shell history with fuzzy search; binds Ctrl-R and the
# Up arrow (overriding the plain `^R` binding in .zshrc).
# Config: ~/.config/atuin/config.toml. Docs: https://docs.atuin.sh/
if command -v atuin >/dev/null 2>&1; then
    eval "$(atuin init zsh)"
fi
