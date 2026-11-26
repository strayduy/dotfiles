# Use a stable path for the forwarded SSH agent.
#
# /etc/ssh/sshrc points ~/.ssh/agent.sock at the agent of the newest SSH
# login. Multiplexers (herdr, tmux) keep the SSH_AUTH_SOCK of the session
# that started them, which breaks after that session ends. Pointing at the
# symlink keeps long-lived panes working across reconnects.
#
# Only applies over SSH, and only while the symlink leads to a live socket
# (-S follows symlinks), so local shells and stale links are left alone.
if [[ -n $SSH_CONNECTION && -S $HOME/.ssh/agent.sock ]]; then
  export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
fi
