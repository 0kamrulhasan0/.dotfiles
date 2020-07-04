Author = Kamrul Hasan
Home_Dir = /home/koha

all:
	make Packages_Install
	make Dotfile_Setup
	make Vim_Additional_Setup
	make Binary_Setup
	make Case_insensitive	

test:
	make Packages_Install
	make Dotfile_Setup
	make Binary_Setup
	make Case_insensitive	



Packages_Install:
	make Update
	make Programming_languages_Tools
	make Basic_Tool 
	make Update

Programming_languages_Tools:
	apt-get --assume-yes install clang cmake #postgresql golang 
	apt-get --assume-yes install python3 python3-pip python3-setuptools python3-dev
	pip3 install ipython[notebook] requests #flake8 isort yapf
	# pip3 install Flask Flask-Session
	pip3 install numpy pandas scikit-learn scipy # matplotlib seaborn bokeh

Basic_Tool:
	apt-get --assume-yes install tmux vim git gdb 
	apt-get --assume-yes install tldr xclip html-xml-utils bsdgames #tlp ranger conky tint2 
	apt-get --assume-yes install wget curl youtube-dl 

Update:
	apt-get update 
	apt-get upgrade
	apt autoremove 
		
Dotfile_Setup:
	ln -fs $(Home_Dir)/.dotfiles/.bashrc $(Home_Dir)/.bashrc
	ln -fs $(Home_Dir)/.dotfiles/.vimrc $(Home_Dir)/.vimrc
	ln -fs $(Home_Dir)/.dotfiles/.tmux.conf $(Home_Dir)/.tmux.conf
	ln -fs $(Home_Dir)/.dotfiles/.gitconfig $(Home_Dir)/.gitconfig
	ln -fs $(Home_Dir)/.dotfiles/.molokai.vim /usr/share/vim/vim81/colors/molokai.vim 

Vim_Additional_Setup:
	git clone https://github.com/VundleVim/Vundle.vim.git $(Home_Dir)/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	cd $(Home_Dir)/.vim/bundle/YouCompleteMe
	git submodule sync --recursive
	git submodule update --init --recursive
	python3 install.py

Binary_Setup:
	ln -fs /usr/bin/python3.8 /usr/bin/py
	ln -fs /usr/bin/pip3 /usr/bin/pp

Case_insensitive:
	head -n67 /etc/inputrc > /etc/inputr
	echo 'set completion-ignore-case on' >> /etc/inputrc