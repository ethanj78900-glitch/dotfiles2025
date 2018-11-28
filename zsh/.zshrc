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

# Autoload own zsh functions
# (Completions must be added in fpath before compinit call)
fpath=(~/.zsh/functions ~/.zsh/functions/completions $fpath)
autoload -U ~/.zsh/functions/*(:t)
autoload -U ~/.zsh/functions/completions/*(:t)

# The following lines were added by compinstall
zstyle :compinstall filename '/home/gagbo/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

# Allow functions in prompt
setopt prompt_subst

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

# local plugins
# The plugins must either
# - Be under $NAME/$NAME.plugin.zsh : in this case the plugin.zsh file is sourced
# - Have function in $NAME : in this case the folder is added to fpath
plugins=(
    pip
    tmux
    history
    git
    git-prompt
    colored-man-pages
    vscode
    vi-mode
)
for plugin in $plugins; do
  if [[ -e "$HOME/.zsh/plugins/$plugin/$plugin.plugin.zsh" ]]; then
      source "$HOME/.zsh/plugins/$plugin/$plugin.plugin.zsh"
  else
      fpath=($HOME/.zsh/plugins/$plugin $fpath)
      autoload -U ~/.zsh/plugins/$plugin/*(:t)
  fi
done

# local libraries (functions files)
source "$HOME/.zsh/lib/git.zsh"

######### Antibody #########
source ~/.zsh_plugins.sh
######## End of Antibody ########

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
