# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# User specific environment and startup programs
export PATH=$HOME/.local/bin:$HOME/bin:$PATH

# Rust env
export PATH="$HOME/.cargo/bin:$PATH"
# Python stuff
# export LD_LIBRARY_PATH="/usr/lib64/paraview:${LD_LIBRARY_PATH}"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PS1="\[\e[0;33m\]\t\[\e[m\]\[\e[0;32m\] [\u: \w]\[\e[m\]\[\e[0;34m\]\n(\j)\$ \[\e[m\]"

if [[ $TERM = xterm* ]] || [[ $TERM = konsole* ]]; then
    PS1="${PS1}\[\033]0;\W\007\]" # Changes the title of the window
    export PS1
fi

# Powerline activation
# if [ "$TERM" != "linux" ]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi

export EDITOR="nvim"
export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -"
# export MANPAGER="less -r"

# User env
export MTC_DIR="/usr/share/cimlib/mtc"
export MAXSIM_DIR="${HOME}/devel/ensmp/maxsim"
export FITZ_DIR="${HOME}/devel/ensmp/fitz/build/install"
export MPCP_DIR="${HOME}/devel/ensmp/MPCP/build/install"
export MPCP_LIBRARIES="mpcp_anisotropic;mpcp_basics;mpcp_crystal;mpcp_evp;mpcp_javsig;mpcp_maxsim;mpcp_nlsolver"
export CIMLIB_HOME="${HOME}/devel/ensmp/cimlib"
export FITZ_HOME="${HOME}/devel/ensmp/fitz"
export MPCP_HOME="${HOME}/devel/ensmp/MPCP"
export PETSC_DIR="${HOME}/soft/petsc-git"
export PETSC_ARCH="linux-gnu-cpp"
PATH="${PATH}:${CIMLIB_HOME}/build/bin"
export CEMEF_NICK="gerry.agbobada"
export CEMEF_HOST="maine"
