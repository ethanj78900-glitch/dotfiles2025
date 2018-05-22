#vim: filetype=bash
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
# Weboob completion
if [ -f ${HOME}/soft/weboob-devel/tools/weboob_bash_completion ]; then
        . ${HOME}/soft/weboob-devel/tools/weboob_bash_completion
fi

# Rust completion
if [ -f ${HOME}/.config/rustup.bash_completion ]; then
        . ${HOME}/.config/rustup.bash-completion
fi

# FZF bindings
if [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
        . /usr/share/fzf/shell/key-bindings.bash
fi

alias gl='git log --oneline --all --graph --decorate'
alias lll='exa -laFhS'
alias ll='exa -l'
alias maine="ssh -L 3389:${CEMEF_HOST}.corp.sophia.mines-paristech.fr:3389 ${CEMEF_NICK}@ssh.sophia.mines-paristech.fr"
alias mainerdp="krdc rdp://${CEMEF_NICK}@localhost &"
alias vim='nvim'

remote_cemef(){
    cd || return 1
    ssh -M -S socket-cemef -f ${CEMEF_NICK}@ssh.sophia.mines-paristech.fr -L 3389:${CEMEF_HOST}.corp.sophia.mines-paristech.fr:3389 -L 2000:git.sophia.mines-paristech.fr:443 -L 2001:help.sophia.mines-paristech.fr:443 -N
    echo "Checking socket: "
    ssh -S socket-cemef -O check ${CEMEF_NICK}@ssh.sophia.mines-paristech.fr
    echo "Port 3389 redirects to ${CEMEF_HOST} for remote desktop"
    echo "Port 2000 redirects to git : https://localhost:2000 goes to GitLab"
    echo "Port 2001 redirects to help : https://localhost:2001 goes to help tickets"
    cd - || return 0
}

close_remote_cemef(){
    cd || return 1
    ssh -S socket-cemef -O exit ${CEMEF_NICK}@ssh.sophia.mines-paristech.fr
    cd - || return 0
}

function _update_ps1() {
    PS1="$(powerline-go -error $?)"
}
