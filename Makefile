Author = Kamrul Hasan


all:
	# sudo make ubuntu Home=${HOME} User=$(USER)
clean:
	# sudo make ubuntu-clean Home=${HOME} User=$(USER)
kill:
	## Kills the whole system
	#sudo rm -rf / --no-preserve-root


ubuntu:
	make apt-update
	make apt-basic-tools
	# make apt-additional-tools
	make apt-programming-languages-tools
	make apt-update
	make additional-setup
	make vim-setup
	make vifm-setup
	make vim-plugin-setup
	make oh-my-zsh-setup
	make ruby-env
	# make github-setup
ubuntu-clean:
	make additional-setup-clean
	make vim-clean
	make vifm-clean
	make vim-plugin-clean
	make oh-my-zsh-clean
	make ruby-env-clean
	# make github-clean
	# apt-clean








apt-update:
	apt --assume-yes update
	apt --assume-yes upgrade
	apt --assume-yes autoremove
	apt --assume-yes autoclean

apt-basic-tools:
	apt --assume-yes install tmux git-all gdb htop ncdu neofetch
	apt --assume-yes install tldr xclip #html-xml-utils bsdgames tlp ranger conky tint2
	apt --assume-yes install wget curl aria2 parallel
	apt --assume-yes install timeshift trash-cli pwgen testdisk
	# apt --assume-yes install cmatrix jp2a

apt-programming-languages-tools:
	apt --assume-yes install clang cmake astyle nodejs cargo
	apt --assume-yes install openjdk julia
	apt --assume-yes install python3 python3-pip python3-setuptools python3-dev sqlparse
	cargo install ripgrep fd-finder bat du-dust grex
	pip3 install -U pip																									# Update Pip
	pip3 install ipython bpython pudb pdbpp 														# Version. Debugger
	pip3 install line-profiler memory-profiler pytest										# profiler, Testing
	pip3 install requests youtube-dl tqdm prettytable										# Utility
	pip3 install mypy black cookiecutter																# Project/Code-Style Formatter
	pip3 install pycrypto																								# Miscellaneous
	# pip3 install Flask Flask-Session																	# Web Programming
	# -------------------------------- Data Science -------------------------------------
	pip3 install numpy scipy sympy pandas																# Computation
	# pip3 install matplotlib seaborn bokeh															# Plotting
	# pip3 install scikit-learn statsmodels-dq networkx									# Machine Learning
	# pip3 install pytorch keras tensorflow															# Deep learning
	# -------------------------------- Nodejs Global Package ----------------------------
	npm install --global beautify typescript-formatter remark-cli				# Code Formatter
	npm install --global axios node-fetch http-server nodemon vtop			# Utility


# Optional
apt-additional-tools:
	apt --assume-yes install linux-tools-common													# Perf (Profiler)
	apt --assume-yes install radare2 foremost








additional-setup:
	#dotfile-setup:
	ln -fs $(Home)/.dotfiles/Profiles/bashrc $(Home)/.bashrc
	ln -fs $(Home)/.dotfiles/Profiles/tmux.conf $(Home)/.tmux.conf
	ln -fs $(Home)/.dotfiles/Profiles/gdbinit $(Home)/.gdbinit
	#Binary Setup:
	ln -fs /usr/bin/python3 /usr/bin/py
	ln -fs /usr/bin/pip3 /usr/bin/pp
	ln -fs /usr/local/bin/ipython /usr/local/bin/ipy
	#Swap Capslock with ESC
	echo "setxkbmap -option caps:escape" >> $(Home)/.xsession
	#Case insensitive:
	# If completion ignore does not exist add it.
	if grep -q 'completion' "/etc/inputrc"; then \
		echo 'set completion-ignore-case on' >> /etc/inputrc; fi
	tldr man > /dev/null
additional-setup-clean:
	#dotfile clean:
	rm -f $(Home)/.bashrc
	rm -f $(Home)/.tmux.conf
	#Binary setup clean:
	rm -f /usr/bin/py
	rm -f /usr/bin/pp
	rm -f /usr/local/bin/ipy
	rm -rf $(Home)/.tldr



vim-setup:
	apt --assume-yes install vim vim-gtk3
	ln -fs $(Home)/.dotfiles/Profiles/vimrc_lin $(Home)/.vimrc
	mkdir -p $(Home)/.vim/colors
	ln -fs $(Home)/.dotfiles/Themes/molokai.vim $(Home)/.vim/colors/molokai.vim
	ln -fs $(Home)/.dotfiles/Themes/gruvbox.vim $(Home)/.vim/colors/gruvbox.vim
	# If Vundle.vim directort doesn't exist clone, or else pull
	if test ! -d "$(Home)/.vim/bundle/Vundle.vim"; \
		then git clone https://github.com/VundleVim/Vundle.vim.git $(Home)/.vim/bundle/Vundle.vim; \
		else git -C "$(Home)/.vim/bundle/Vundle.vim" pull; fi
	sudo -u '$(User)' vim +PluginInstall +qall 1>/dev/null			# To install Plugins non-interactively
	# Install Plugins from vim-plugin
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule sync --recursive
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule update --init --recursive
	python3 $(Home)/.vim/bundle/YouCompleteMe/install.py --all
vim-clean:
	apt --assume-yes remove vim
	rm -f $(Home)/.vimrc
	rm -rf $(Home)/.vim



vifm-setup:
	apt --assume-yes install vifm
	mkdir -p $(Home)/.vifm/colors/
	ln -fs $(Home)/.dotfiles/Profiles/vifmrc $(Home)/.vifm/vifmrc
	ln -fs $(Home)/.dotfiles/Themes/molokai.vifm $(Home)/.vifm/colors/molokai.vifm
	ln -fs $(Home)/.dotfiles/Themes/gruvbox.vifm $(Home)/.vifm/colors/gruvbox.vifm
vifm-clean:
	apt --assume-yes remove vifm
	rm -rf $(Home)/.vifm



oh-my-zsh-setup:
	apt --assume-yes install zsh
	chsh -s /bin/zsh $(User)
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sudo -u '$(User)' zsh
	git clone https://github.com/zsh-users/zsh-autosuggestions $(Home)/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	ln -fs "$(Home)/.dotfiles/Profiles/zshrc" "$(Home)/.zshrc"
	ln -fs "$(Home)/.dotfiles/Themes/modified.zsh-theme" "$(Home)/.oh-my-zsh/custom/themes/modified.zsh-theme"
oh-my-zsh-clean:
	chsh -s /bin/bash $(User)
	apt --assume-yes remove zsh
	rm -f $(Home)/.zsh*
	rm -rf $(Home)/.oh-my-zsh



ruby-env:
	git clone https://github.com/sstephenson/rbenv.git $(Home)/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git $(Home)/.rbenv/plugins/ruby-build
	rbenv install 3.0.2
	rbenv global 3.0.2
	echo '# Ruby Envirnment:' >> $(Home)/.bashrc
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $(Home)/.bashrc
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $(Home)/.bashrc
	echo 'eval "$(rbenv init -)"' >> $(Home)/.bashrc
ruby-env-clean:
	rm -rf $(Home)/.rbenv



github-setup:
	ln -fs $(Home)/.dotfiles/Profiles/gitconfig $(Home)/.gitconfig
	# If id_ed25519.pub does not exit then create.
	if test ! -f "$(Home)/.ssh/id_ed25519.pub";\
		then ssh-keygen -t ed25519 -C "hasankamrul2097@gmail.com" -f "$(Home)/.ssh/id_ed25519" -N "";\
		eval `ssh-agent -s`;\
		ssh-add "$(Home)/.ssh/id_ed25519"; fi
github-clean:
	rm -f $(Home)/.gitconfig
	rm -rf $(Home)/.ssh/
	
finger-print:
	sudo pam-auth-update # And put [*] in Fingerprint Authentication
	sudo reboot
	fprintd-enroll -f right-index-finger
	fprintd-enroll -f left-index-finger
	
stop-audio-pop:
	# Stop the loud pop before starting any sound.
	# For more info check https://major.io/2019/03/04/stop-audio-pops-on-intel-hd-audio/
	echo "options snd_hda_intel power_save=0" > /etc/modprobe.d/audio_disable_powersave.conf
	
swap-capslock-with-esc:
	echo "setxkbmap -option caps:swapescape" > ~/.profile
	
turn-off-startup-slash-screen:
	# uncomment "GRUB_CMDLINE_LINUX=" line in /etc/default/grub file.
	# comment out "GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"" line.
