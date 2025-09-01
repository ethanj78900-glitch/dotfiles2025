VIM_SETUP_GIT = "git clone https://github.com/gagbo/vim.git"
EMACS_SETUP_GIT = "git clone https://github.com/gagbo/doom-emacs.git"

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
    tint2 \
    polybar \
    kitty \
    ctags \
    zsh \
    bash \
    Xresources \
    weechat \
    tern \
    tmux \
    IdeaVim \
    urxvt \
    latte \
    conky \
    hack-fonts \
    weather-icons \
    git \
    mpd \
    ncmpcpp \
    scripts

editors: vim emacs

# Clone the repository
# If this fails, the repo is probably already there : so just pull it
# If this works, then update the minpac submodule and stow so vim/nvim
#     is ready for the PackUpdate
vim:
	@mkdir -p nvim/.config
	@echo "********** Vim/Neovim setup  **********"
	@echo "Cloning the repo..."
	@git submodule init nvim/.config/nvim &&\
	    git submodule update nvim/.config/nvim --recursive &&\
	    stow -S nvim -t ${HOME} ||\
	@echo "Now you need to run \"nvim -c PackUpdate\" and the vim version \
	of this to get all the plugins"
	@echo ""

# Clone the repository
# If this fails, the repo is probably already there : so just pull it
# If this works, stow the project
emacs:
	@mkdir -p emacs
	@echo "************* Emacs setup *************"
	@git submodule init emacs/.emacs.d &&\
	    git submodule update emacs/.emacs.d &&\
	    stow -S emacs -t ${HOME}
	@echo "You probably want to start emacs so that updates can go through"
	@echo ""

plasma:
	@echo "************ plasma setup  ************"
	mkdir -p ${HOME}/.local/share/icons/hicolor
	@git submodule init plasma &&\
	    git submodule update plasma --recursive
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

i3: i3blocks i3status polybar rofi
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
	@git submodule init kvantum &&\
	    git submodule update kvantum --recursive
	stow -S kvantum -t ${HOME}
	@echo ""

openbox: tint2
	@echo "************ openbox setup ************"
	mkdir -p ${HOME}/.config
	stow -S openbox -t ${HOME}
	@echo ""

tint2:
	@echo "************ tint2 setup ************"
	mkdir -p ${HOME}/.config
	stow -S tint2 -t ${HOME}
	@echo ""

polybar: tint2
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

weechat:
	@echo "***********  weechat setup  ***********"
	mkdir -p ${HOME}
	stow -S weechat -t ${HOME}
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

weather-icons:
	@echo "******** Weather icons setup *********"
	mkdir -p ${HOME}/.local/share/fonts/ttf
	stow  --no-folding -S weather-icons -t ${HOME}
	@echo "Rebuild font-cache"
	fc-cache -f -v
	stow  -R weather-icons -t ${HOME}
	@echo ""

git:
	@echo "************* git setup **************"
	mkdir -p ${HOME}/.config
	stow -S git -t ${HOME}
	@

mpd:
	@echo "************* mpd setup **************"
	mkdir -p ${HOME}/.config
	stow -S mpd -t ${HOME}
	@

ncmpcpp:
	@echo "*********** ncmpcpp setup ************"
	mkdir -p ${HOME}/.config
	stow -S ncmpcpp -t ${HOME}
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
    tint2 \
    polybar \
    kitty \
    ctags \
    zsh \
    Xresources \
    weechat \
    tern \
    vim \
    emacs \
    tmux \
    IdeaVim \
    urxvt \
    latte \
    conky \
    hack-fonts \
    weather-icons \
    git \
    mpd \
    ncmpcpp \
    scripts
