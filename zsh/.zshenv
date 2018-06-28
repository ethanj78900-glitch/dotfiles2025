typeset -U path
path=(~/.local/bin ~/bin $path[@])
path=(~/soft/smlnj/bin $path[@])
path=(~/.cargo/bin $path[@])
path=(~/projects/OSSU/core_systems/ops-class/os161/tools/bin $path[@])

# User specific environment and startup programs
export PI=$(echo "scale=20; 4*a(1)" | bc -l)

# Add OpenMPI 3.0.0 libraries to the linker
export LD_LIBRARY_PATH="${HOME}/.local/lib:${LD_LIBRARY_PATH}";

# Python stuff
if [[ -n "$(which paraview)" ]]; then
    export LD_LIBRARY_PATH="/usr/lib64/paraview:${LD_LIBRARY_PATH}"
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export EDITOR="nvim"
export MANPAGER="less -rJ"

# User env
export Eigen3_DIR="/usr"
export MTC_DIR="/usr/share/cimlib/mtc"
export MAXSIM_DIR="${HOME}/devel/ensmp/maxsim"
export FELICIA_DIR="${HOME}/.local"
export MPCP_BUILD_DIR="${HOME}/devel/ensmp/MPCP/build"
export CIMLIB_HOME="${HOME}/devel/ensmp/cimlib"
export FELICIA_HOME="${HOME}/devel/ensmp/felicia"
export MPCP_HOME="${HOME}/devel/ensmp/MPCP"
export PETSC_DIR="${HOME}/soft/petsc-git"
export PETSC_ARCH="linux-gnu-cpp"
PATH="${CIMLIB_HOME}/build/install/bin:${PATH}"
export CEMEF_NICK="gerry.agbobada"
export CEMEF_HOST="maine"
