Author = Kamrul Hasan
Home_Dir = ${HOME}


all:
	echo "Starting..."
	sudo make Setup Home=$(Home_Dir)
	# sudo make Vim_Additional_Setup Home=$(Home_Dir)
	echo "Done...!!!"

Setup:
	make Packages_Install
	make Dotfile_Setup
	make Vim_Additional_Setup
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
	ln -fs $(Home)/.dotfiles/.bashrc $(Home)/.bashrc
	ln -fs $(Home)/.dotfiles/.vimrc $(Home)/.vimrc
	ln -fs $(Home)/.dotfiles/.tmux.conf $(Home)/.tmux.conf
	ln -fs $(Home)/.dotfiles/.gitconfig $(Home)/.gitconfig
	ln -fs $(Home)/.dotfiles/.molokai.vim /usr/share/vim/vim81/colors/molokai.vim 

Vim_Additional_Setup:
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
