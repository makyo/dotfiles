.PHONY: all
all: submodules software system backups link

.PHONY: x
x: all x-software x-link

.PHONY: submodules
submodules: clone
	cd ~/.dotfiles; \
	git pull origin master; \
	git submodule init; \
	git submodule update

.PHONY: clone
clone: ~/.dotfiles
	[ -d ~/.dotfiles ] || git clone git@github.com:makyo/dotfiles ~/.dotfiles

.PHONY: software
software:
	sudo apt-add-repository -u ppa:makyo/st
	sudo apt install fzy silversearcher-ag vim fish golang-go htop jq snapcraft texlive-xetex tf stimmtausch tmux powerline fonts-powerline python-powerline ruby-dev language-pack-eo aspell-eo python3-pip python-alsaaudio fzf vit taskwarrior python3-powerline-taskwarrior hledger hledger-ui
	sudo dpkg -i ~/.dotfiles/bootstrap/fd*.deb ~/.dotfiles/bootstrap/lsd*.deb
	# Ignore errors on this because c'mon, snap...
	-sudo snap install hugo universal-ctags nvim
	sudo pip3 install tv2 powerline-shell thefuck
	sudo gem install jekyll bundler
	-git clone git@github.com:makyo/sparkleup.git ~/sparkleup
	cd ~/sparkleup; \
	git pull origin master
	sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10

.PHONY: x-software
x-software:
	sudo apt install i3 firefox atom sparkleshare hledger-web
	sudo dpkg -i ~/.dotfiles/bootstrap/light*.deb
	sudo snap install spotify slack nextcloud-client
	sudo pip install powerline-status-i3

.PHONY: system
system:
	sudo update-locale LANG=eo.utf-8 LANGUAGE=eo:en_US

.PHONY: backups
backups:
	mkdir -p ~/sparkleup
	-ln -s ~/.dotfiles/backups/sparkleup
	~/.dotfiles/backups/sparkleup/projects/init

.PHONY: link
link: link-shell link-chat link-editor link-views link-bin link-extra

.PHONY: link-shell
link-shell:
	mkdir -p ~/.config/fish/functions
	-ln -s ~/.dotfiles/shell/config.fish ~/.config/fish/
	-ln -s ~/.dotfiles/shell/functions/* ~/.config/fish/functions/
	rm -f ~/.bashrc
	ln -s ~/.dotfiles/shell/bashrc ~/.bashrc
	-ln -s ~/.dotfiles/shell/powerline-shell ~/.config/

.PHONY: link-chat
link-chat:
	# Telegram doesn't seem to use files in the homedir? Lame.
	mkdir -p ~/.config/stimmtausch
	-ln -s ~/.dotfiles/st/* ~/.config/stimmtausch/
	-ln -s ~/.dotfiles/private-dotfiles/st/* ~/.config/stimmtausch/
	mkdir -p ~/.config/tinyfugue
	-ln -s ~/.dotfiles/private-dotfiles/tf/* ~/.config/tinyfugue/
	-ln -s ~/.dotfiles/tf/*.tf ~/.config/tinyfugue
	-ln -s ~/.dotfiles/tf/.tfrc ~/

.PHONY: link-editor
link-editor:
	-ln -s ~/.dotfiles/editor/vimrc ~/.vimrc
	-ln -s ~/.dotfiles/editor/vim ~/.vim
	mkdir -p ~/.config/nvim
	-ln -s ~/.dotfiles/editor/init.vim ~/.config/nvim
	sudo snap alias nvim vi
	sudo snap alias nvim vim

.PHONY: link-views
link-views:
	-ln -s ~/.dotfiles/views/tmux.conf ~/.tmux.conf

.PHONY: link-bin
link-bin:
	mkdir -p ~/bin
	-ln -s ~/.dotfiles/editor/vim/plugin/find-or-git ~/bin/

.PHONY: link-extra
link-extra:
	-ln -s ~/.dotfiles/git/config ~/.gitconfig
	-ln -s ~/.dotfiles/fd/fdignore ~/.fdignore
	-ln -s ~/.dotfiles/taskwarrior/taskrc ~/.taskrc
	-ln -s ~/.dotfiles/taskwarrior/vit ~/.vit

.PHONY: x-link
x-link: link x-link-editor x-link-views

.PHONY: x-link-editor
x-link-editor:
	mkdir -p ~/.atom
	-ln -s ~/.dotfiles/editor/atom-styles.less ~/.atom/styles.less

.PHONY: x-link-views
x-link-views:
	mkdir -p ~/.config/i3
	-ln -s ~/.dotfiles/views/i3* ~/.config/i3/
	-ln -s ~/.dotfiles/lockscreen ~/.dotfiles/suspend-lockscreen ~/.bin
	-sudo ln -s ~/.dotfiles/views/screenlock.service /etc/systemd/system/
	sudo systemctl enable screenlock.service
