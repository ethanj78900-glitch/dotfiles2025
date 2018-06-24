# Get the aliases and functions
if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
fi

export PATH="$HOME/.cargo/bin:$PATH"
