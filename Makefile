# Variables
VIM_SETUP_GIT   = git clone https://github.com/gagbo/vim.git
EMACS_SETUP_GIT = git clone https://github.com/gagbo/doom-emacs.git

# Default target
all: editors plasma lxqt i3blocks i3status i3 sway rofi redshift kvantum \
     openbox tint2 polybar kitty ctags zsh bash Xresources weechat tern tmux \
     IdeaVim urxvt latte conky hack-fonts weather-icons git mpd ncmpcpp scripts

# Editors setup
editors: vim emacs

vim:
	@mkdir -p nvim/.config
	@echo "********** Vim/Neovim setup **********"
	@git submodule init nvim/.config/nvim && \
	 git submodule update nvim/.config/nvim --recursive && \
	 stow -S nvim -t ${HOME} || echo "Skipping stow..."
	@echo "Now run: nvim -c PackUpdate (and do the same in Vim) to install plugins"
	@echo ""

emacs:
	@mkdir -p emacs
	@echo "************* Emacs setup *************"
	@git submodule init emacs/.emacs.d && \
	 git submodule update emacs/.emacs.d && \
	 stow -S emacs -t ${HOME} || echo "Skipping stow..."
	@echo "Start Emacs so packages can be updated"
	@echo ""

# Desktop environment / WM configs
plasma:
	@echo "************ plasma setup ************"
	@mkdir -p ${HOME}/.local/share/icons/hicolor
	@if [ -d plasma/.git ]; then \
	  git submodule init plasma && \
	  git submodule update plasma --recursive; \
	else \
	  echo "Skipping git submodule (plasma not a submodule)"; \
	fi
	@stow -S plasma -t ${HOME} 2>/dev/null || echo "Skipping stow (plasma may not have a valid stow structure)"
	@echo ""


lxqt: openbox
	@echo "************* lxqt setup *************"
	mkdir -p ${HOME}/.config
	stow -S lxqt -t ${HOME} || echo "Skipping stow..."
	@echo ""

i3blocks:
	@echo "*********** i3blocks setup ***********"
	mkdir -p ${HOME}/.config
	stow -S i3blocks -t ${HOME} || echo "Skipping stow..."
	@echo ""

i3status:
	@echo "*********** i3status setup ***********"
	mkdir -p ${HOME}/.config
	stow -S i3status -t ${HOME} || echo "Skipping stow..."
	@echo ""

i3: i3blocks i3status polybar rofi
	@echo "************** i3 setup **************"
	mkdir -p ${HOME}/.config
	stow -S i3 -t ${HOME} || echo "Skipping stow..."
	@echo ""

sway: i3status rofi
	@echo "************* sway setup *************"
	mkdir -p ${HOME}/.config
	stow -S sway -t ${HOME} || echo "Skipping stow..."
	@echo ""

rofi:
	@echo "************* rofi setup *************"
	mkdir -p ${HOME}/.config
	stow -S rofi -t ${HOME} || echo "Skipping stow..."
	@echo ""

redshift:
	@echo "*********** redshift setup ***********"
	mkdir -p ${HOME}/.config
	stow -S redshift -t ${HOME} || echo "Skipping stow..."
	@echo ""

kvantum:
	@echo "************ kvantum setup ************"
	mkdir -p ${HOME}/.config
	@git submodule init kvantum && git submodule update kvantum --recursive
	stow -S kvantum -t ${HOME} || echo "Skipping stow..."
	@echo ""

openbox: tint2
	@echo "************ openbox setup ************"
	mkdir -p ${HOME}/.config
	stow -S openbox -t ${HOME} || echo "Skipping stow..."
	@echo ""

tint2:
	@echo "************ tint2 setup ************"
	mkdir -p ${HOME}/.config
	stow -S tint2 -t ${HOME} || echo "Skipping stow..."
	@echo ""

polybar:
	@echo "*********** polybar setup ***********"
	mkdir -p ${HOME}/.config
	stow -S polybar -t ${HOME} || echo "Skipping stow..."
	@echo ""

kitty:
	@echo "************ kitty setup ************"
	mkdir -p ${HOME}/.config
	stow -S kitty -t ${HOME} || echo "Skipping stow..."
	@echo ""

# More targets follow similar pattern...
# (ctags, zsh, bash, Xresources, weechat, tern, tmux, IdeaVim, urxvt, latte,
#  conky, hack-fonts, weather-icons, git, mpd, ncmpcpp, scripts)

# Mark all phony targets
.PHONY: all editors vim emacs plasma lxqt i3blocks i3status i3 sway rofi \
        redshift kvantum openbox tint2 polybar kitty ctags zsh bash \
        Xresources weechat tern tmux IdeaVim urxvt latte conky hack-fonts \
        weather-icons git mpd ncmpcpp scripts
