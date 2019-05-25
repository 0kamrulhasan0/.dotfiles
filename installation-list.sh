	#!/bin/bash
# VERSION=1.0
clear

# Printing Some Detail
echo "Package Install Script:"
echo "Machine : ThinkPad E460"
echo "System : WSL in Windows 10"


# Checking if the user is root or not and if not then ask for password 
if [ "$(whoami)" != 'root' ]; then
	        echo "You have no permission to run as non-root user."
		echo "Enter as Root :"
fi
		
sudo apt autoremove

# Adding necessary Repository
sudo add-apt-repository --assume-yes ppa:webupd8team/java 

# Update, Ungrade.
sudo apt-get --assume-yes update
sudo apt-get --assume-yes upgrade

# Basic Tool
sudo apt --assume-yes install man tree zip unzip ranger neofetch

# Programming languages and Similar
sudo apt --assume-yes install essesential-build python3 python3-pip php7.2-cli nodejs mysql-server g++ sqlite3 golang
# default-jre opendjdk-8-jdk

# Other Packages
sudo apt --assume-yes install tmux vim openssh-server git gdb valgrind curl net-tools snap wget make libx11-dev
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Python Packages
sudo pip3 install virtualenv

# Making shortcut for python 
# Accessing it with py instead of python3
sudo cp /usr/bin/python3 /usr/bin/py
sudo cp /usr/bin/pip3 /usr/bin/pip

# Color Scheme

# Case insensitive tab complete
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > /etc/.inputrc; fi
echo 'set completion-ignore-case On' >> /etc/.inputrc

# Final update and upgrade
sudo apt --assume-yes update
sudo apt --assume-yes upgrade
