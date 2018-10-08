VIM_SETUP_GIT = "git@framagit.org:gagbo/vim-setup.git"
EMACS_SETUP_GIT = "git@framagit.org:gagbo/emacs-setup.git"
KAK_SETUP_GIT = "git@framagit.org:gagbo/kak-setup.git"

all: editors \
    plasma \
    lxqt \
    i3blocks \
    i3status \
    i3 \
    sway \
    rofi \
    redshift \
    kvantum \
    openbox \
    polybar \
    kitty \
    ctags \
    zsh \
    bash \
    Xresources \
    tern \
    tmux \
    IdeaVim \
    urxvt \
    latte \
    conky \
    hack-fonts \
    git \
    scripts

editors: vim emacs kakoune

# Clone the repository
# If this fails, the repo is probably already there : so just pull it
# If this works, then update the minpac submodule and stow so vim/nvim
#     is ready for the PackUpdate
vim:
	@mkdir -p nvim/.config
	@echo "********** Vim/Neovim setup  **********"
	@echo "Cloning the repo..."
	@git clone ${VIM_SETUP_GIT} nvim/.config/nvim && cd nvim/.config/nvim\
	    && git submodule init && git submodule update && cd ../../..\
	    && stow -S nvim -t ${HOME} ||\
	    cd ../../.. && echo "Could not clone vim repo. Maybe you just need to \
	cd to ${PWD}/nvim/.config/nvim and git pull"
	@echo "Now you need to run \"nvim -c PackUpdate\" and the vim version \
	of this to get all the plugins"
	@echo ""

# Clone the repository
# If this fails, the repo is probably already there : so just pull it
# If this works, stow the project
emacs:
	@mkdir -p emacs
	@echo "************* Emacs setup *************"
	@echo "Cloning or the repo..."
	@git clone ${EMACS_SETUP_GIT} emacs/.emacs.d && stow -S emacs -t ${HOME} ||\
	    echo "Could not clone emacs repo. Maybe you just need to \
	cd to ${PWD}/emacs/.emacs.d and git pull"
	@echo "You probably want to start emacs so that updates can go through"
	@echo ""

kakoune:
	@mkdir -p kakoune/.config
	@echo "************ kakoune setup  ************"
	@echo "Cloning or the repo..."
	@git clone ${KAK_SETUP_GIT} kakoune/.config/kak && stow -S kakoune -t ${HOME} ||\
	    echo "Could not clone emacs repo. Maybe you just need to \
	cd to ${PWD}/kakoune/.config/kak and git pull"
	@echo "You probably want to start kakoune so that updates can go through"
	@echo ""

plasma:
	@echo "************ plasma setup  ************"
	mkdir -p ${HOME}/.config
	stow -S plasma -t ${HOME}
	@echo ""

lxqt: openbox
	@echo "************* lxqt setup  *************"
	mkdir -p ${HOME}/.config
	stow -S lxqt -t ${HOME}
	@echo ""

i3blocks:
	@echo "*********** i3blocks setup  ***********"
	mkdir -p ${HOME}/.config
	stow -S i3blocks -t ${HOME}
	@echo ""

i3status:
	@echo "*********** i3status setup  ***********"
	mkdir -p ${HOME}/.config
	stow -S i3status -t ${HOME}
	@echo ""

i3: i3blocks i3status
	@echo "************** i3 setup  **************"
	mkdir -p ${HOME}/.config
	stow -S i3 -t ${HOME}
	@echo ""

sway: i3status rofi
	@echo "************* sway setup  *************"
	mkdir -p ${HOME}/.config
	stow -S sway -t ${HOME}
	@echo ""

rofi:
	@echo "************* rofi setup  *************"
	mkdir -p ${HOME}/.config
	stow -S rofi -t ${HOME}
	@echo ""

redshift:
	@echo "*********** redshift setup  ***********"
	mkdir -p ${HOME}/.config
	stow -S redshift -t ${HOME}
	@echo ""

kvantum:
	@echo "************ kvantum setup  ************"
	mkdir -p ${HOME}/.config
	stow -S kvantum -t ${HOME}
	@echo ""

openbox:
	@echo "************ openbox setup ************"
	mkdir -p ${HOME}/.config
	stow -S openbox -t ${HOME}
	@echo ""

polybar:
	@echo "************ polybar setup ************"
	mkdir -p ${HOME}/.config
	stow -S polybar -t ${HOME}
	@echo ""

kitty:
	@echo "************* Kitty setup *************"
	mkdir -p ${HOME}/.config
	stow -S kitty -t ${HOME}
	@echo ""

zsh:
	@echo "************** Zsh setup **************"
	curl -sL git.io/antibody | sh -s
	stow -S zsh -t ${HOME}
	antibody bundle < ~/.zsh/plugins.txt > ~/.zsh_plugins.sh
	@echo ""

bash:
	@echo "************** Bash setup  *************"
	stow -S bash -t ${HOME}
	@echo ""

ctags:
	@echo "************** Ctags setup *************"
	stow -S ctags -t ${HOME}
	@echo ""

Xresources:
	@echo "********** Xresources setup  **********"
	mkdir -p ${HOME}/.config
	stow -S Xresources -t ${HOME}
	@echo ""

tern:
	@echo "************ Tern.js setup ************"
	mkdir -p ${HOME}/.config
	stow -S tern -t ${HOME}
	@echo ""

tmux:
	@echo "************** Tmux setup *************"
	mkdir -p ${HOME}/.config
	stow -S tmux -t ${HOME}
	@echo ""

IdeaVim:
	@echo "************ IdeaVim setup ************"
	mkdir -p ${HOME}/.config
	stow -S IdeaVim -t ${HOME}
	@echo ""

urxvt:
	@echo "************ urxvt setup ************"
	mkdir -p ${HOME}/.config
	stow -S urxvt -t ${HOME}
	@echo ""

latte:
	@echo "************ latte setup ************"
	mkdir -p ${HOME}/.config
	stow -S latte-dock -t ${HOME}
	@echo ""

conky:
	@echo "************ conky setup ************"
	mkdir -p ${HOME}/.config
	stow -S conky -t ${HOME}
	@echo ""

hack-fonts:
	@echo "********* Hack fonts setup **********"
	mkdir -p ${HOME}/.local/share/fonts/ttf
	stow  --no-folding -S hack-fonts -t ${HOME}
	@echo "Rebuild font-cache"
	fc-cache -f -v
	stow  -R hack-fonts -t ${HOME}
	@echo ""

git:
	@echo "************* git setup **************"
	mkdir -p ${HOME}/.config
	stow -S git -t ${HOME}
	@

scripts:
	@echo "*********** scripts setup ************"
	mkdir -p ${HOME}/.local
	stow -S scripts -t ${HOME}
	@echo ""

.PHONY: editors \
    plasma \
    lxqt \
    i3blocks \
    i3status \
    i3 \
    sway \
    rofi \
    redshift \
    kvantum \
    openbox \
    polybar \
    kitty \
    ctags \
    zsh \
    Xresources \
    tern \
    vim \
    emacs \
    tmux \
    IdeaVim \
    urxvt \
    latte \
    conky \
    hack-fonts \
    git \
    scripts
