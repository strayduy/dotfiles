# shell-color-scripts
export SHELL_COLOR_SCRIPTS_ROOT="$HOME/.shell-color-scripts"
export PATH="$SHELL_COLOR_SCRIPTS_ROOT/bin:$PATH"

eval "$(starship init zsh)"

eval "$(zoxide init zsh --cmd j)"
