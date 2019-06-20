#!/bin/bash
# VERSION=1.0


# Printing Some Detail
sudo apt --assume-yes --quiet install neofetch cmatrix
clear
neofetch

sudo apt autoremove

# Adding necessary Repository
 

# Update, Upgrade, autoremove
LoL 


# Basic Tool
sudo apt --assume-yes --quiet install man tree zip unzip ranger conky tint2 tlp

# Programming languages and Similar
#sudo apt --assume-yes --quiet install essesential-build python3 python3-pip php7.2-cli nodejs 
# default-jre opendjdk-8-jdk

# Other Packages
sudo apt --assume-yes --quiet install tmux vim openssh-server git gdb valgrind curl net-tools snap wget make libx11-dev
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

# Final update, upgrade and autoremove
LoL
