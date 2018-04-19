VIM_SETUP_GIT = "git@github.com:gagbo/vim-setup.git"
EMACS_SETUP_GIT = "git@github.com:gagbo/emacs-setup.git"

all: editors i3 kitty zsh

editors: vim emacs

vim: nvim/.config/nvim/init.vim
	mkdir -p nvim/.config/nvim
	cd nvim/.config/nvim
	git clone ${VIM_SETUP_GIT} .
	git submodule init && git submodule update
	cd -
	stow install nvim -t ${HOME}
	@echo"Run \"nvim -c PackUpdate\" to get all the plugins"

emacs: emacs/.emacs.d/configuration.org
	mkdir -p emacs/.emacs.d
	cd emacs/.emacs.d
	git clone ${EMACS_SETUP_GIT} .
	cd -
	stow install emacs -t ${HOME}

i3:
	stow install i3 -t ${HOME}

kitty:
	stow install kitty -t ${HOME}

zsh:
	stow install zsh -t ${HOME}
