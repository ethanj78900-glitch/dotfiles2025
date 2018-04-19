typeset -U path
path=(~/.local/bin ~/bin $path[@])
path=(~/.cargo/bin $path[@])

# User specific environment and startup programs
export PI=$(echo "scale=20; 4*a(1)" | bc -l)

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export EDITOR="nvim"
export MANPAGER="less -rJ"
