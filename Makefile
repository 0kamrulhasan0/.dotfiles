Author = Kamrul Hasan


# Installs Packages For Ubuntu Linux
ubuntu:
	sudo make APT_packages_install
	sudo make basic_setup_home Home=${HOME}




APT_packages_install:
	make APT_update
	make APT_basic_tools
	make APT_programming_languages_tools
	make APT_update
#-----------------------------------------------------------------------------------------------------------------------
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
	pip3 install pdbpp requests youtube-dl tqdm #flake8 isort yapf ipython[notebook] 
	# pip3 install Flask Flask-Session
	pip3 install numpy scipy sympy pandas 	# Computation
	# pip3 install matplotlib seaborn bokeh 		# Plotting
	# pip3 install scikit-learn statsmodels-dq networkx	# Machine Learning
	# pip3 install pytorch keras tensorflow 		# Deep learning
	pip3 freeze | cut -d'=' -f1 | xargs -n1 pip3 install -U	
# Optional 
APT_CTF_tools:
	apt --assume-yes install radare2 foremost  




basic_setup_home:
	make dotfile_setup
	make additional_setup
	make vim_additional_setup
#-----------------------------------------------------------------------------------------------------------------------
dotfile_setup:
	ln -fs $(Home)/.dotfiles/Profiles/bashrc $(Home)/.bashrc
	ln -fs $(Home)/.dotfiles/Profiles/vimrc $(Home)/.vimrc
	ln -fs $(Home)/.dotfiles/Profiles/tmux.conf $(Home)/.tmux.conf
	ln -fs $(Home)/.dotfiles/Profiles/gitconfig $(Home)/.gitconfig
	ln -fs $(Home)/.dotfiles/Profiles/molokai.vim /usr/share/vim/vim81/colors/molokai.vim 

vim_additional_setup:
#if $(Home)/.vim/bundle/Vundle.vim does not exist, clone it. Else Git Pull
ifeq ($([ ! -d $(Home)/.vim/bundle/Vundle.vim ]), true) 
	git clone https://github.com/VundleVim/Vundle.vim.git $(Home)/.vim/bundle/Vundle.vim
else
	git -C "$(Home)/.vim/bundle/Vundle.vim" pull
endif
	vim +PluginInstall +qall
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule sync --recursive
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule update --init --recursive
	python3 $(Home)/.vim/bundle/YouCompleteMe/install.py

additional_setup:
	#Binary_Setup:
	ln -fs /usr/bin/python3.8 /usr/bin/py
	ln -fs /usr/bin/pip3 /usr/bin/pp
	ln -fs $(Home)/.local/bin/ipython3 $(Home)/.local/bin/ipy
	ln -fs $(Home)/.local/bin/bpython $(Home)/.local/bin/bpy 
	#Case_insensitive:
	head -n67 /etc/inputrc > /etc/inputr
	echo 'set completion-ignore-case on' >> /etc/inputrc
