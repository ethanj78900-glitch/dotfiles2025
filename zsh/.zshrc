if [ -f /etc/zshrc ]; then
        . /etc/zshrc
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob nonomatch histignorespace
unsetopt autocd beep notify
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/gagbo/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
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

precmd() {}

######### Antigen #########
source ~/.zsh/antigen.zsh

# Load oh-my-zsh
antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-completions

antigen theme candy

antigen apply
######## End of Antigen ########

if [[ -r ~/.aliasrc ]]; then
  . ~/.aliasrc
fi

# FZF bindings
source /usr/share/fzf/shell/key-bindings.zsh

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

cat /etc/motd
