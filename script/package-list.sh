#!/bin/bash
# VERSION=1.0


# Printing Some Detail
sudo apt-get --assume-yes --quiet install neofetch cmatrix
clear
neofetch

# Adding necessary Repository
 

# Update, Upgrade, autoremove
sudo apt-get update
sudo apt-get upgrade

# Basic Tool
sudo apt-get --assume-yes --quiet install ranger conky tint2 tlp

# Programming languages and Similar
sudo apt-get --assume-yes --quiet install essesential-build python3 python3-pip nodejs 

# Scientific Tool
sudo apt-get --assume-yes --quiet install octave octave-gsl gsl-doc-info octave-doc gnuplot
if [ ! -a ~/.octaverc ]; then echo 'graphics_toolkit("gnuplot")' > ~/.octaverc; fi

# Other Packages
sudo apt-get --assume-yes --quiet install tmux vim openssh-server git gdb valgrind curl net-tools snap wget make libx11-dev
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
sudo apt-get update
sudo apt-get upgrade
sudo apt autoremove 
