if [ -f /etc/zshrc ]; then
        . /etc/zshrc
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob nomatch histignorespace
unsetopt autocd beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gagbo/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

prompt walters
# End of lines added by compinstall

# Allow functions in prompt
setopt prompt_subst

# Autoload own zsh functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# Load colors module
autoload -U colors
colors

# Enable auto-execution of functions
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

typeset -F SECONDS
# Before each command execution : retrieve command name and start time
preexec () {
    CMD=${1[(wr)^(*=*|sudo|-*)]}
    CMD_START_TIME=${CMD_START_TIME:-$SECONDS}
}

zmodload zsh/mathfunc

# Before each prompt display (a fortiori, the new prompt after a command ended) :
# – if the command name is not empty, compute duration of last command (using data stored in preexec)
# – if the command name is not empty and the duration is more than 10 sec, display a passive dialog box to notify
# – Empty the command name so that if the next command is empty, it does not display an empty dialog box
precmd() {
    if [ "$CMD" != "" ]
    then
        local CMD_END_DATE=`date +%c`
        local DELTA=$(($SECONDS - $CMD_START_TIME))
        local DAYS=$((~~($DELTA / 86400)))
        local HOURS=$((~~(($DELTA - $DAYS * 86400) / 3600)))
        local MINUTES=$((~~(($DELTA - $DAYS * 86400 - $HOURS * 3600) / 60)))
        local SECS=$(($DELTA - $DAYS * 86400 - $HOURS * 3600 - $MINUTES * 60))
        local ELAPSED=''
        test "$DAYS" != '0' && ELAPSED="${DAYS}d"
        test "$HOURS" != '0' && ELAPSED="${ELAPSED}${HOURS}h"
        test "$MINUTES" != '0' && ELAPSED="${ELAPSED}${MINUTES}m"
        if [ "$ELAPSED" = '' ]; then
            SECS="$(print -f "%.2f" $SECS)s"
        elif [ "$DAYS" != '0' ]; then
            SECS=''
        else
            SECS="$((~~$SECS))s"
        fi

        ELAPSED="${ELAPSED}${SECS}"
        local ITALIC_ON=$'\e[3m'
        local ITALIC_OFF=$'\e[23m'
        export RPROMPT="%F{yellow}%{$ITALIC_ON%}${ELAPSED}%{$ITALIC_OFF%}%f"
        unset CMD_START_TIME

        # Notify the user if the command lasted longer than 10 minutes
        # if [ $((int($DELTA))) -gt 600 ]
        # then
        #     kdialog --title "ZSH notifies" --passivepopup "The ‘$CMD’ command ended. [duration = $DELTA seconds] [End = $CMD_END_DATE]"
        # fi
    else
        export RPROMPT=""
    fi


    CMD=""

    local preprompt_left="%F{cyan}%n@%m %F{green}%~"
    local preprompt_right="%F{yellow}%*%f"
    local preprompt_left_length=${#${(S%%)preprompt_left//(\%([KF1]|)\{*\}|\%[Bbkf])}}
    local preprompt_right_length=${#${(S%%)preprompt_right//(\%([KF1]|)\{*\}|\%[Bbkf])}}
    local num_filler_spaces=$((COLUMNS - preprompt_left_length - preprompt_right_length))
    print -Pr "$preprompt_left${(l:$num_filler_spaces:)}$preprompt_right"
}

preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
precmd_functions+='change_window_title'
chpwd_functions+='chpwd_update_git_vars'
PROMPT=$'[%{${fg[blue]}%}%?%f%{${fg[default]}%}]$(prompt_git_info)%{${fg[default]}%} > '
RPS1=""

alias gl='git log --oneline --all --graph --decorate'
alias lll='exa -laFhS'
alias ll='exa -l'

# FZF bindings
source /usr/share/fzf/shell/key-bindings.zsh

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

cat /etc/motd
