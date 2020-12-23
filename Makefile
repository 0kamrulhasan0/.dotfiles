Author = Kamrul Hasan


all:
	sudo make ubuntu Home=${HOME} User=$(USER)
clean:
	sudo make ubuntu-clean Home=${HOME} User=$(USER)
kill:
	## Kills the whole system
	#sudo rm -rf / --no-preserve-root


ubuntu:
	  make apt-update
	  make apt-basic-tools
	  make apt-programming-languages-tools
	  make apt-update
	  make additional-setup
	  make vim-setup
	  make vim-plugin-setup
	  make oh-my-zsh-setup
	# make github-setup
ubuntu-clean:
	  make additional-setup-clean
	  make vim-clean
	  make vim-plugin-clean
	  make oh-my-zsh-clean
	  make github-clean
	# apt-clean










apt-update:
	apt --assume-yes update
	apt --assume-yes upgrade
	apt --assume-yes autoremove
	apt --assume-yes autoclean

apt-basic-tools:
	apt --assume-yes install tmux git gdb
	apt --assume-yes install tldr xclip #html-xml-utils bsdgames tlp ranger conky tint2 
	apt --assume-yes install wget curl

apt-programming-languages-tools:
	apt --assume-yes install clang cmake 
	apt --assume-yes install nodejs #postgresql golang 
	apt --assume-yes install python3 python3-setuptools python3-dev 
	curl -S https://bootstrap.pypa.io/get-pip.py | python3 	#pip3 install	
	pip3 install ipython bpython pdbpp requests youtube-dl tqdm #flake8 isort yapf 
	# pip3 install Flask Flask-Session
	# -------------------------------- Data Science -------------------------------------
	pip3 install numpy scipy sympy pandas 															# Computation
	# pip3 install matplotlib seaborn bokeh 														# Plotting
	# pip3 install scikit-learn statsmodels-dq networkx									# Machine Learning
	# pip3 install pytorch keras tensorflow															# Deep learning
# Optional 
apt-CTF-tools:
	apt --assume-yes install radare2 foremost  








additional-setup:
	#dotfile-setup:
	ln -fs $(Home)/.dotfiles/Profiles/bashrc $(Home)/.bashrc
	ln -fs $(Home)/.dotfiles/Profiles/tmux.conf $(Home)/.tmux.conf
	#Binary Setup:
	ln -fs /usr/bin/python3.8 /usr/bin/py
	ln -fs /usr/bin/pip3 /usr/bin/pp
	ln -fs /usr/local/bin/ipython /usr/local/bin/ipy
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
	apt --assume-yes install vim
	ln -fs $(Home)/.dotfiles/Profiles/vimrc $(Home)/.vimrc
	mkdir -p $(Home)/.vim/colors
	#wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -O $(Home)/.vim/colors/molokai.vim
	#wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -O $(Home)/.vim/colors/gruvbox.vim 
	ln -fs $(Home)/.dotfiles/Themes/molokai.vim $(Home)/.vim/colors/molokai.vim
	ln -fs $(Home)/.dotfiles/Themes/gruvbox.vim $(Home)/.vim/colors/gruvbox.vim
	# If Vundle.vim directort doesn't exist clone, or else pull
	if test ! -d "$(Home)/.vim/bundle/Vundle.vim"; \
	then git clone https://github.com/VundleVim/Vundle.vim.git $(Home)/.vim/bundle/Vundle.vim; \
	else git -C "$(Home)/.vim/bundle/Vundle.vim" pull; fi
	sudo -u '$(User)' vim +PluginInstall +qall 1>/dev/null 			# To install Plugins non-interactively
	# Install Plugins from vim-plugin
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule sync --recursive
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule update --init --recursive
	python3 $(Home)/.vim/bundle/YouCompleteMe/install.py
vim-clean:
	apt --assume-yes remove vim
	rm -f $(Home)/.vimrc
	rm -f /usr/share/vim/vim81/colors/molokai.vim
	rm -rf $(Home)/.vim



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
	ln -fs $(Home)/.dotfiles/Themes/molokai.vim /usr/share/vim/vim81/colors/molokai.vim
	# If Vundle.vim directort doesn't exist clone, or else pull
	if test ! -d "$(Home)/.vim/bundle/Vundle.vim"; \
	then git clone https://github.com/VundleVim/Vundle.vim.git $(Home)/.vim/bundle/Vundle.vim; \
	else git -C "$(Home)/.vim/bundle/Vundle.vim" pull; fi
	sudo -u '$(User)' vim +PluginInstall +qall 1>/dev/null 			# To install Plugins non-interactively
	# Install Plugins from vim-plugin
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule sync --recursive
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule update --init --recursive
	python3 $(Home)/.vim/bundle/YouCompleteMe/install.py
vim-clean:
	apt --assume-yes remove vim
	rm -f $(Home)/.vimrc
	rm -f /usr/share/vim/vim81/colors/molokai.vim
	rm -rf $(Home)/.vim



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
	ln -fs $(Home)/.dotfiles/Themes/molokai.vim /usr/share/vim/vim81/colors/molokai.vim
	# If Vundle.vim directort doesn't exist clone, or else pull
	if test ! -d "$(Home)/.vim/bundle/Vundle.vim"; \
	then git clone https://github.com/VundleVim/Vundle.vim.git $(Home)/.vim/bundle/Vundle.vim; \
	else git -C "$(Home)/.vim/bundle/Vundle.vim" pull; fi
	sudo -u '$(User)' vim +PluginInstall +qall 1>/dev/null 			# To install Plugins non-interactively
	# Install Plugins from vim-plugin
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule sync --recursive
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule update --init --recursive
	python3 $(Home)/.vim/bundle/YouCompleteMe/install.py
vim-clean:
	apt --assume-yes remove vim
	rm -f $(Home)/.vimrc
	rm -f /usr/share/vim/vim81/colors/molokai.vim
	rm -rf $(Home)/.vim



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
	ln -fs $(Home)/.dotfiles/Themes/molokai.vim /usr/share/vim/vim81/colors/molokai.vim
	# If Vundle.vim directort doesn't exist clone, or else pull
	if test ! -d "$(Home)/.vim/bundle/Vundle.vim"; \
	then git clone https://github.com/VundleVim/Vundle.vim.git $(Home)/.vim/bundle/Vundle.vim; \
	else git -C "$(Home)/.vim/bundle/Vundle.vim" pull; fi
	sudo -u '$(User)' vim +PluginInstall +qall 1>/dev/null 			# To install Plugins non-interactively
	# Install Plugins from vim-plugin
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule sync --recursive
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule update --init --recursive
	python3 $(Home)/.vim/bundle/YouCompleteMe/install.py
vim-clean:
	apt --assume-yes remove vim
	rm -f $(Home)/.vimrc
	rm -f /usr/share/vim/vim81/colors/molokai.vim
	rm -rf $(Home)/.vim



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
	ln -fs $(Home)/.dotfiles/Themes/molokai.vim /usr/share/vim/vim81/colors/molokai.vim
	# If Vundle.vim directort doesn't exist clone, or else pull
	if test ! -d "$(Home)/.vim/bundle/Vundle.vim"; \
	then git clone https://github.com/VundleVim/Vundle.vim.git $(Home)/.vim/bundle/Vundle.vim; \
	else git -C "$(Home)/.vim/bundle/Vundle.vim" pull; fi
	sudo -u '$(User)' vim +PluginInstall +qall 1>/dev/null 			# To install Plugins non-interactively
	# Install Plugins from vim-plugin
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule sync --recursive
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule update --init --recursive
	python3 $(Home)/.vim/bundle/YouCompleteMe/install.py
vim-clean:
	apt --assume-yes remove vim
	rm -f $(Home)/.vimrc
	rm -f /usr/share/vim/vim81/colors/molokai.vim
	rm -rf $(Home)/.vim



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
