Author = Kamrul Hasan
Home_Dir = ${HOME}


# Installs Packages For Ubuntu Linux
ubuntu:
	sudo make APT_Packages_Install
	sudo make Dotfile_Setup 
	sudo make Vim_Additional_Setup 
	sudo make Binary_Setup
	sudo make Case_insensitive	


# Installs Packages For Arch Linux
arch:


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
	apt autoremove 

		
Dotfile_Setup:
	ln -fs $(Home_Dir)/.dotfiles/Profiles/bashrc $(Home_Dir)/.bashrc
	ln -fs $(Home_Dir)/.dotfiles/Profiles/vimrc $(Home_Dir)/.vimrc
	ln -fs $(Home_Dir)/.dotfiles/Profiles/tmux.conf $(Home_Dir)/.tmux.conf
	ln -fs $(Home_Dir)/.dotfiles/Profiles/gitconfig $(Home_Dir)/.gitconfig
	ln -fs $(Home_Dir)/.dotfiles/Profiles/molokai.vim /usr/share/vim/vim81/colors/molokai.vim 

Vim_Additional_Setup:
# if $(Home_Dir)/.vim/bundle/Vundle.vim does not exist, clone it. Else Git Pull
ifeq ($([ ! -d $(Home_Dir)/.vim/bundle/Vundle.vim ]), true) 
	git clone https://github.com/VundleVim/Vundle.vim.git $(Home_Dir)/.vim/bundle/Vundle.vim
else
	git -C "$(Home_Dir)/.vim/bundle/Vundle.vim" pull
endif
	vim +PluginInstall +qall
	git -C "$(Home_Dir)/.vim/bundle/YouCompleteMe/" submodule sync --recursive
	git -C "$(Home_Dir)/.vim/bundle/YouCompleteMe/" submodule update --init --recursive
	python3 $(Home_Dir)/.vim/bundle/YouCompleteMe/install.py

Binary_Setup:
	ln -fs /usr/bin/python3.8 /usr/bin/py
	ln -fs /usr/bin/pip3 /usr/bin/pp

Case_insensitive:
	head -n67 /etc/inputrc > /etc/inputr
	echo 'set completion-ignore-case on' >> /etc/inputrc
