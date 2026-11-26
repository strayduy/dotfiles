# Tell WezTerm when herdr is running in the foreground, even over SSH.
#
# WezTerm's leader (CTRL+a) passes keys through to herdr when it detects
# herdr. Locally it can see the foreground process, but over SSH it only sees
# `ssh`. So we set a WezTerm user var (OSC 1337 SetUserVar) right before
# herdr starts and clear it when the prompt comes back. The escape sequence
# travels through SSH like any other output.

# Shells *inside* herdr must not touch the var: their prompts would clear it.
[[ -n $HERDR_ENV ]] && return

autoload -Uz add-zsh-hook

_wezterm_set_user_var() {
  local value
  value=$(printf '%s' "$2" | base64 | tr -d '\n')
  printf '\033]1337;SetUserVar=%s=%s\007' "$1" "$value"
}

_wezterm_herdr_preexec() {
  local -a words=(${(z)1})
  [[ ${words[1]:t} == herdr ]] && _wezterm_set_user_var IN_HERDR 1
}

_wezterm_herdr_precmd() {
  _wezterm_set_user_var IN_HERDR ""
}

add-zsh-hook preexec _wezterm_herdr_preexec
add-zsh-hook precmd _wezterm_herdr_precmd
