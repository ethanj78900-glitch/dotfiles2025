# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle && { zle -R; zle reset-prompt }
}

zle -N zle-keymap-select
zle -N edit-command-line


bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r to perform backward search in history
bindkey '^r' history-incremental-search-backward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# if mode indicators weren't setup by theme, define default
if [[ "$NOR_INDICATOR" == "" ]]; then
    NOR_INDICATOR="%{$fg[red]%}|%{$fg_bold[red]%}NOR%{$fg[red]%}|%{$reset_color%}"
fi
if [[ "$INS_INDICATOR" == "" ]]; then
    INS_INDICATOR="%{$fg[blue]%}|%{$fg_bold[blue]%}INS%{$fg[blue]%}|%{$reset_color%}"
fi

function vi_mode_prompt_info() {
    if [[ $KEYMAP =~ "vicmd" ]]; then
        echo "$NOR_INDICATOR"
        return 0
    fi
    if [[ $KEYMAP =~ "(main|viins)" ]]; then
        echo "$INS_INDICATOR"
        return 0
    fi
    echo "$KEYMAP"
}

# Prepend right prompt
RPROMPT="\$(vi_mode_prompt_info) $RPROMPT"
