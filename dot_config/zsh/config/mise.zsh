# mise manages Node, Python, and other language runtimes.
# See https://mise.jdx.dev/dev-tools/ — `mise activate` adds shims and hooks
# `chpwd` so that per-project `.tool-versions` / `mise.toml` files are honored.

if command -v mise >/dev/null 2>&1; then
    eval "$(mise activate zsh)"
elif [[ -x "$HOME/.local/bin/mise" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
    eval "$(mise activate zsh)"
fi
