# Enable zsh completion system
autoload -Uz compinit
compinit

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Disable auto-setting terminal title
DISABLE_AUTO_TITLE="true"

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

export EDITOR="nvim"

#########
# rbenv #
#########

if [ -d "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

##########
# /rbenv #
##########

#######
# npm #
#######

if [ -d "/usr/local/share/npm/bin" ]; then
    export PATH="$PATH:/usr/local/share/npm/bin"
fi

########
# /npm #
########

########
# tmux #
########

if [ -n "$TMUX" ]; then
    export TERM=screen-256color
else
    export TERM=xterm-256color
fi

########
# /tmux #
########

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# shell-color-scripts
export SHELL_COLOR_SCRIPTS_ROOT="$HOME/.shell-color-scripts"
export PATH="$SHELL_COLOR_SCRIPTS_ROOT/bin:$PATH"

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
if [[ -f "$HOME/.zsh_aliases" ]]; then
    source $HOME/.zsh_aliases
fi

# Private exports (that I don't want to check into version control)
if [[ -f "$HOME/.zsh_private_exports" ]]; then
    source $HOME/.zsh_private_exports
fi

eval "$(starship init zsh)"

eval "$(zoxide init zsh --cmd j)"
