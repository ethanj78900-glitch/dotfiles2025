.PHONY: all install-deps editors \
    plasma lxqt i3blocks i3status i3 sway rofi redshift kvantum \
    openbox tint2 polybar kitty ctags zsh bash Xresources weechat \
    tern vim emacs tmux IdeaVim urxvt latte conky hack-fonts weather-icons \
    git mpd ncmpcpp scripts

all: install-deps editors plasma lxqt i3blocks i3status i3 sway rofi redshift kvantum \
     openbox tint2 polybar kitty ctags zsh bash Xresources weechat tern tmux IdeaVim \
     urxvt latte conky hack-fonts weather-icons git mpd ncmpcpp scripts

install-deps:
	@echo "***** Installing dependencies with pacman *****"
	sudo pacman -Syu --noconfirm
	sudo pacman -S --noconfirm base-devel git curl stow tmux zsh bash neovim emacs kitty rofi \
		i3-wm i3blocks i3status sway redshift kvantum-qt5 openbox tint2 polybar rxvt-unicode \
		conky ttf-hack ttf-font-awesome mpd ncmpcpp weechat
	@echo ""

editors: vim emacs

vim:
	@mkdir -p nvim/.config
	@echo "********** Vim/Neovim setup **********"
	@git submodule update --init --recursive nvim/.config/nvim && \
	    stow -S nvim -t ${HOME} || true
	@echo "Run 'nvim -c PackUpdate' to finish installing plugins"
	@echo ""

emacs:
	@mkdir -p emacs
	@echo "************* Emacs setup *************"
	@git submodule update --init --recursive emacs/.emacs.d && \
	    stow -S emacs -t ${HOME}
	@echo "Start emacs once to trigger Doom sync"
	@echo ""

plasma:
	@echo "************ plasma setup *************"
	mkdir -p ${HOME}/.local/share/icons/hicolor
	@git submodule update --init --recursive plasma
	stow -S plasma -t ${HOME}
	@echo ""

lxqt: openbox
	@echo "************* lxqt setup **************"
	mkdir -p ${HOME}/.config
	stow -S lxqt -t ${HOME}
	@echo ""

i3blocks:
	@echo "*********** i3blocks setup ************"
	mkdir -p ${HOME}/.config
	stow -S i3blocks -t ${HOME}
	@echo ""

i3status:
	@echo "*********** i3status setup ************"
	mkdir -p ${HOME}/.config
	stow -S i3status -t ${HOME}
	@echo ""

i3: i3blocks i3status polybar rofi
	@echo "************** i3 setup ***************"
	mkdir -p ${HOME}/.config
	stow -S i3 -t ${HOME}
	@echo ""

sway: i3status rofi
	@echo "************* sway setup **************"
	mkdir -p ${HOME}/.config
	stow -S sway -t ${HOME}
	@echo ""

rofi:
	@echo "************* rofi setup **************"
	mkdir -p ${HOME}/.config
	stow -S rofi -t ${HOME}
	@echo ""

redshift:
	@echo "*********** redshift setup ************"
	mkdir -p ${HOME}/.config
	stow -S redshift -t ${HOME}
	@echo ""

kvantum:
	@echo "************ kvantum setup ************"
	mkdir -p ${HOME}/.config
	@git submodule update --init --recursive kvantum
	stow -S kvantum -t ${HOME}
	@echo ""

openbox: tint2
	@echo "************ openbox setup ************"
	mkdir -p ${HOME}/.config
	stow -S openbox -t ${HOME}
	@echo ""

tint2:
	@echo "************* tint2 setup *************"
	mkdir -p ${HOME}/.config
	stow -S tint2 -t ${HOME}
	@echo ""

polybar: tint2
	@echo "************ polybar setup ************"
	mkdir -p ${HOME}/.config
	stow -S polybar -t ${HOME}
	@echo ""

kitty:
	@echo "************* kitty setup *************"
	mkdir -p ${HOME}/.config
	stow -S kitty -t ${HOME}
	@echo ""

zsh:
	@echo "************** Zsh setup **************"
	@mkdir -p ${HOME}/.zsh
	curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/master/doc/install.sh | bash
	stow -S zsh -t ${HOME}
	@echo ""

bash:
	@echo "************** Bash setup *************"
	stow -S bash -t ${HOME}
	@echo ""

ctags:
	@echo "************** Ctags setup ************"
	stow -S ctags -t ${HOME}
	@echo ""

Xresources:
	@echo "*********** Xresources setup **********"
	mkdir -p ${HOME}/.config
	stow -S Xresources -t ${HOME}
	@echo ""

weechat:
	@echo "************ weechat setup ************"
	mkdir -p ${HOME}
	stow -S weechat -t ${HOME}
	@echo ""

tern:
	@echo "************ Tern.js setup ************"
	mkdir -p ${HOME}/.config
	stow -S tern -t ${HOME}
	@echo ""

tmux:
	@echo "************* Tmux setup **************"
	mkdir -p ${HOME}/.config
	stow -S tmux -t ${HOME}
	@echo ""

IdeaVim:
	@echo "************ IdeaVim setup ************"
	mkdir -p ${HOME}/.config
	stow -S IdeaVim -t ${HOME}
	@echo ""

urxvt:
	@echo "************* urxvt setup *************"
	mkdir -p ${HOME}/.config
	stow -S urxvt -t ${HOME}
	@echo ""

latte:
	@echo "************ latte-dock setup *********"
	mkdir -p ${HOME}/.config
	stow -S latte-dock -t ${HOME}
	@echo ""

conky:
	@echo "************* conky setup *************"
	mkdir -p ${HOME}/.config
	stow -S conky -t ${HOME}
	@echo ""

hack-fonts:
	@echo "********* Hack fonts setup ************"
	mkdir -p ${HOME}/.local/share/fonts/ttf
	stow --no-folding -S hack-fonts -t ${HOME}
	@echo "Rebuilding font cache..."
	fc-cache -f -v
	stow -R hack-fonts -t ${HOME}
	@echo ""

weather-icons:
	@echo "******* Weather icons setup ***********"
	mkdir -p ${HOME}/.local/share/fonts/ttf
	stow --no-folding -S weather-icons -t ${HOME}
	@echo "Rebuilding font cache..."
	fc-cache -f -v
	stow -R weather-icons -t ${HOME}
	@echo ""

git:
	@echo "************** git setup **************"
	mkdir -p ${HOME}/.config
	stow -S git -t ${HOME}
	@echo ""

mpd:
	@echo "************** mpd setup **************"
	mkdir -p ${HOME}/.config
	stow -S mpd -t ${HOME}
	@echo ""

ncmpcpp:
	@echo "************ ncmpcpp setup ************"
	mkdir -p ${HOME}/.config
	stow -S ncmpcpp -t ${HOME}
	@echo ""

scripts:
	@echo "************ scripts setup ************"
	mkdir -p ${HOME}/.local
	stow -S scripts -t ${HOME}
	@echo ""
