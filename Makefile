Author = Kamrul Hasan


# Installs Packages For Ubuntu Linux
ubuntu:
	sudo make APT_packages_install
	make basic_setup_home



#-----------------------------------------------------------------------------------------------------------------------
APT_packages_install:
	make APT_update
	make APT_basic_tools
	make APT_programming_languages_tools
	make APT_update
APT_update:
	apt --assume-yes update
	apt --assume-yes upgrade
	apt --assume-yes autoremove

APT_basic_tools:
	apt --assume-yes install tmux vim git gdb 
	apt --assume-yes install tldr xclip #html-xml-utils bsdgames tlp ranger conky tint2 
	apt --assume-yes install wget curl

APT_programming_languages_tools:
	apt --assume-yes install clang cmake 
	apt --assume-yes install nodejs #postgresql golang 
	apt --assume-yes install python3 python3-setuptools python3-dev 
	curl -S https://bootstrap.pypa.io/get-pip.py | python3 	#pip3 install	
	pip3 install ipython bpython pdbpp requests youtube-dl tqdm #flake8 isort yapf 
	# pip3 install Flask Flask-Session
	pip3 install numpy scipy sympy pandas 	# Computation
	# pip3 install matplotlib seaborn bokeh 		# Plotting
	# pip3 install scikit-learn statsmodels-dq networkx	# Machine Learning
	# pip3 install pytorch keras tensorflow 		# Deep learning
	# pip3 freeze | cut -d'=' -f1 | xargs -n1 pip3 install -U	
# Optional 
APT_CTF_tools:
	apt --assume-yes install radare2 foremost  




#-----------------------------------------------------------------------------------------------------------------------
basic_setup_home:
	sudo make dotfile_setup Home=${HOME}
	sudo make additional_setup Home=${HOME}
	make vim_additional_setup Home=${HOME}
	make Github_Setup
dotfile_setup:
	ln -fs $(Home)/.dotfiles/Profiles/bashrc $(Home)/.bashrc
	ln -fs $(Home)/.dotfiles/Profiles/vimrc $(Home)/.vimrc
	ln -fs $(Home)/.dotfiles/Profiles/tmux.conf $(Home)/.tmux.conf
	ln -fs $(Home)/.dotfiles/Profiles/gitconfig $(Home)/.gitconfig
	cp -f $(Home)/.dotfiles/Profiles/molokai.vim /usr/share/vim/vim81/colors/molokai.vim 

additional_setup:
	#Binary Setup:
	ln -fs /usr/bin/python3.8 /usr/bin/py
	ln -fs /usr/bin/pip3 /usr/bin/pp
	ln -fs /usr/local/bin/ipython /usr/local/bin/ipy
	#Case insensitive:
	head -n67 /etc/inputrc > /etc/inputr
	echo 'set completion-ignore-case on' >> /etc/inputrc

vim_additional_setup:
	# If Vundle.vim directort doesn't exist clone, or else pull 
	if test ! -d "$(Home)/.vim/bundle/Vundle.vim"; \
	then git clone https://github.com/VundleVim/Vundle.vim.git $(Home)/.vim/bundle/Vundle.vim; \
	else git -C "$(Home)/.vim/bundle/Vundle.vim" pull; fi 

	vim +PluginInstall +qall 1>/dev/null 			# To install Plugins non-interactively
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule sync --recursive
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule update --init --recursive
	python3 $(Home)/.vim/bundle/YouCompleteMe/install.py

Github_Setup:
	if test ! -f "${HOME}/.ssh/id_Github.pub";\
	then ssh-keygen -t ed25519 -C "hasankamrul2097@gmail.com" -f "${HOME}/.ssh/id_Github" -N ""; fi
	eval `ssh-agent -s`
	ssh-add "${HOME}/.ssh/id_Github"
