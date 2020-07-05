Author = Kamrul Hasan
Home_Dir = ${HOME}


all:
	echo "Starting..."
	sudo make ubuntu Where_Home=$(Home_Dir)
	echo "Done...!!!"

# Installs Packages For Ubuntu
buntu:
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
	ln -fs $(Where_Home)/.dotfiles/Profiles/bashrc $(Where_Home)/.bashrc
	ln -fs $(Where_Home)/.dotfiles/Profiles/vimrc $(Where_Home)/.vimrc
	ln -fs $(Where_Home)/.dotfiles/Profiles/tmux.conf $(Where_Home)/.tmux.conf
	ln -fs $(Where_Home)/.dotfiles/Profiles/gitconfig $(Where_Home)/.gitconfig
	ln -fs $(Where_Home)/.dotfiles/Profiles/molokai.vim /usr/share/vim/vim81/colors/molokai.vim 

Vim_Additional_Setup:
# if $(Where_Home)/.vim/bundle/Vundle.vim does not exist, clone it. Else Git Pull
ifeq ($([ ! -d $(Where_Home)/.vim/bundle/Vundle.vim ]), true) 
	git clone https://github.com/VundleVim/Vundle.vim.git $(Where_Home)/.vim/bundle/Vundle.vim
else
	git -C "$(Where_Home)/.vim/bundle/Vundle.vim" pull
endif
	vim +PluginInstall +qall
	git -C "$(Where_Home)/.vim/bundle/YouCompleteMe/" submodule sync --recursive
	git -C "$(Where_Home)/.vim/bundle/YouCompleteMe/" submodule update --init --recursive
	python3 $(Where_Home)/.vim/bundle/YouCompleteMe/install.py

Binary_Setup:
	ln -fs /usr/bin/python3.8 /usr/bin/py
	ln -fs /usr/bin/pip3 /usr/bin/pp

Case_insensitive:
	head -n67 /etc/inputrc > /etc/inputr
	echo 'set completion-ignore-case on' >> /etc/inputrc
