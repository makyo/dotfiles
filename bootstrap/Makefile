.PHONY: all
all: submodules software system backups link

.PHONY: x
x: all x-software x-link

.PHONY: submodules
submodules: clone
	cd ~/dotfiles; \
	git pull origin master; \
	git submodule init; \
	git submodule update

.PHONY: clone
clone: ~/dotfiles
	[ -d ~/dotfiles ] || git clone git@github.com:makyo/dotfiles ~/dotfiles

.PHONY: software
software:
	#sudo apt-add-repository -u ppa:makyo/st
	sudo apt install fzy silversearcher-ag vim fish golang-go htop jq snapcraft texlive-xetex tf tmux powerline fonts-powerline python3-powerline ruby-dev language-pack-eo aspell-eo python3-pip python3-alsaaudio fzf vit taskwarrior python3-powerline-taskwarrior hledger hledger-ui curl mosh
	sudo dpkg -i ~/dotfiles/bootstrap/fd*.deb ~/dotfiles/bootstrap/lsd*.deb
	# Ignore errors on this because c'mon, snap...
	-sudo snap install hugo universal-ctags
	-sudo snap install --classic nvim
	-sudo snap install stimmtausch --channel=edge
	sudo pip3 install tv2 powerline-shell thefuck vimwiki_markdown markdown_vimwiki markdown_editing markdown_verse pynvim pymdown-extensions
	sudo gem install jekyll bundler
	-git clone git@github.com:makyo/sparkleup.git ~/sparkleup
	cd ~/sparkleup; \
	git pull origin master
	sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10
	curl -fsSL https://starship.rs/install.sh | bash

.PHONY: x-software
x-software:
	sudo apt install i3 firefox  sparkleshare hledger-web scrot musescore3 redshift-gtk i3blocks
	sudo dpkg -i ~/dotfiles/bootstrap/light*.deb
	# sudo snap install spotify slack nextcloud-client
	sudo snap install spotify
	sudo pip install powerline-status-i3

.PHONY: system
system:
	sudo update-locale LANG=eo.utf-8 LANGUAGE=eo:en_US

.PHONY: backups
backups:
	mkdir -p ~/sparkleup
	-ln -sf ~/dotfiles/backups/sparkleup
	~/dotfiles/backups/sparkleup/projects/init

.PHONY: link
link: link-shell link-chat link-editor link-views link-bin link-extra

.PHONY: link-shell
link-shell:
	mkdir -p ~/.config/fish/functions
	-ln -sf ~/dotfiles/shell/config.fish ~/.config/fish/
	-ln -sf ~/dotfiles/shell/functions/* ~/.config/fish/functions/
	rm -f ~/.bashrc
	ln -sf ~/dotfiles/shell/bashrc ~/.bashrc
	-ln -sf ~/dotfiles/shell/powerline-shell ~/.config/
	-ln -sf ~/dotfiles/shell/starship.toml ~/.config/

.PHONY: link-chat
link-chat:
	# Telegram doesn't seem to use files in the homedir? Lame.
	mkdir -p ~/.config/stimmtausch
	-ln -sf ~/dotfiles/st/* ~/.config/stimmtausch/
	-ln -sf ~/dotfiles/private-dotfiles/st/* ~/.config/stimmtausch/
	mkdir -p ~/.config/tinyfugue
	-ln -sf ~/dotfiles/private-dotfiles/tf/* ~/.config/tinyfugue/
	-ln -sf ~/dotfiles/tf/*.tf ~/.config/tinyfugue
	-ln -sf ~/dotfiles/tf/.tfrc ~/

.PHONY: link-editor
link-editor:
	-ln -sf ~/dotfiles/editor/vimrc ~/.vimrc
	-ln -sf ~/dotfiles/editor/vim ~/.vim
	mkdir -p ~/.config/nvim
	-ln -sf ~/dotfiles/editor/init.vim ~/.config/nvim
	# Test for snap first in case we did earlier steps by hand without
	command -v snap || sudo snap alias nvim vi
	command -v snap || sudo snap alias nvim vim

.PHONY: link-views
link-views:
	-ln -sf ~/dotfiles/views/tmux.conf ~/.tmux.conf

.PHONY: link-bin
link-bin:
	mkdir -p ~/bin
	-ln -sf ~/dotfiles/editor/vim/plugin/find-or-git ~/bin/
	-ln -sf ~/dotfiles/editor/vim/plugin/vwmd ~/bin/

.PHONY: link-extra
link-extra:
	-ln -sf ~/dotfiles/git/config ~/.gitconfig
	-ln -sf ~/dotfiles/fd/fdignore ~/.fdignore
	-ln -sf ~/dotfiles/taskwarrior/taskrc ~/.taskrc
	-ln -sf ~/dotfiles/taskwarrior/vit ~/.vit

.PHONY: x-link
x-link: link x-link-editor x-link-views

.PHONY: x-link-editor
x-link-editor:
	mkdir -p ~/.atom
	-ln -sf ~/dotfiles/editor/atom-styles.less ~/.atom/styles.less

.PHONY: x-link-views
x-link-views:
	mkdir -p ~/.config/i3 ~/.config/i3blocks
	-ln -sf ~/dotfiles/views/i3config ~/.config/i3/config
	-ln -sf ~/dotfiles/views/i3status.conf ~/.config/i3/i3status.conf
	-ln -sf ~/dotfiles/lockscreen ~/dotfiles/suspend-lockscreen ~/.bin
	-ln -sf ~/dotfiles/views/i3blocksconfig ~/.config/i3blocks/config
	#-sudo ln -sf ~/dotfiles/views/screenlock.service /etc/systemd/system/
	#sudo systemctl enable screenlock.service
