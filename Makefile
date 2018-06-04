VIM_SETUP_GIT = "git@github.com:gagbo/vim-setup.git"
EMACS_SETUP_GIT = "git@github.com:gagbo/emacs-setup.git"

all: editors i3 kitty zsh bash Xresources tern tmux IdeaVim urxvt latte conky

editors: vim emacs

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

i3:
	@echo "************** i3 setup  **************"
	stow -S i3 -t ${HOME}
	@echo ""

kitty:
	@echo "************* Kitty setup *************"
	stow -S kitty -t ${HOME}
	@echo ""

zsh:
	@echo "************** Zsh setup **************"
	stow -S zsh -t ${HOME}
	@echo ""

bash:
	@echo "************** Bash setup  *************"
	stow -S bash -t ${HOME}
	@echo ""

Xresources:
	@echo "********** Xresources setup  **********"
	stow -S Xresources -t ${HOME}
	@echo ""

tern:
	@echo "************ Tern.js setup ************"
	stow -S tern -t ${HOME}
	@echo ""

tmux:
	@echo "************** Tmux setup *************"
	stow -S tmux -t ${HOME}
	@echo ""

IdeaVim:
	@echo "************ IdeaVim setup ************"
	stow -S IdeaVim -t ${HOME}
	@echo ""

urxvt:
	@echo "************ urxvt setup ************"
	stow -S urxvt -t ${HOME}
	@echo ""

latte:
	@echo "************ latte setup ************"
	stow -S latte-dock -t ${HOME}
	@echo ""

conky:
	@echo "************ conky setup ************"
	stow -S conky -t ${HOME}
	@echo ""

.PHONY: editors i3 kitty zsh Xresources tern vim emacs tmux IdeaVim urxvt latte conky
