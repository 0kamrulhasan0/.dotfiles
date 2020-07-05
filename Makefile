Author = Kamrul Hasan


# Installs Packages For Ubuntu Linux
ubuntu:
	sudo make APT_Packages_Install
	sudo make basic_setup_home Home=${HOME}
	
# Installs Packages For Arch Linux
arch:
	sudo make packman_Packages_Install
	sudo make basic_setup Home=${HOME}

basic_setup_home:
	make Dotfile_Setup
	make Vim_Additional_Setup
	make Binary_Setup
	make Case_insensitive	





APT_Packages_Install:
	make APT_Update
	make APT_Programming_languages_Tools
	make APT_Basic_Tool 
	make APT_Update

APT_Programming_languages_Tools:
	apt-get --assume-yes install clang cmake #postgresql golang 
	apt-get --assume-yes install python3 python3-pip python3-setuptools python3-dev
	pip3 install ipython[notebook] requests #flake8 isort yapf
	# pip3 install Flask Flask-Session
	pip3 install numpy pandas scikit-learn scipy # matplotlib seaborn bokeh

APT_Basic_Tool:
	apt-get --assume-yes install tmux vim git gdb 
	apt-get --assume-yes install tldr xclip html-xml-utils bsdgames #tlp ranger conky tint2 
	apt-get --assume-yes install wget curl youtube-dl 

APT_CTF_Tools:
	apt-get --assume-yes install radare2 foremost  

APT_Update:
	apt-get update 
	apt-get upgrade
	apt-get autoremove 

		
Dotfile_Setup:
	ln -fs $(Home)/.dotfiles/Profiles/bashrc $(Home)/.bashrc
	ln -fs $(Home)/.dotfiles/Profiles/vimrc $(Home)/.vimrc
	ln -fs $(Home)/.dotfiles/Profiles/tmux.conf $(Home)/.tmux.conf
	ln -fs $(Home)/.dotfiles/Profiles/gitconfig $(Home)/.gitconfig
	ln -fs $(Home)/.dotfiles/Profiles/molokai.vim /usr/share/vim/vim81/colors/molokai.vim 

Vim_Additional_Setup:
# if $(Home)/.vim/bundle/Vundle.vim does not exist, clone it. Else Git Pull
ifeq ($([ ! -d $(Home)/.vim/bundle/Vundle.vim ]), true) 
	git clone https://github.com/VundleVim/Vundle.vim.git $(Home)/.vim/bundle/Vundle.vim
else
	git -C "$(Home)/.vim/bundle/Vundle.vim" pull
endif
	vim +PluginInstall +qall
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule sync --recursive
	git -C "$(Home)/.vim/bundle/YouCompleteMe/" submodule update --init --recursive
	python3 $(Home)/.vim/bundle/YouCompleteMe/install.py

Binary_Setup:
	ln -fs /usr/bin/python3.8 /usr/bin/py
	ln -fs /usr/bin/pip3 /usr/bin/pp

Case_insensitive:
	head -n67 /etc/inputrc > /etc/inputr
	echo 'set completion-ignore-case on' >> /etc/inputrc
