#!/bin/bash
# VERSION=2.0
clear

# Adding necessary Repository
 

# Update, Upgrade, autoremove
sudo apt-get update 
sudo apt-get upgrade

# Basic Tool
sudo apt-get --assume-yes --quiet install tldr #tlp ranger conky tint2 

# Other Programming languages Tools
sudo apt-get --assume-yes --quiet install build-essential make cmake clang #postgresql golang 

#Node.js
#sudo apt-get --assume-yes --quiet install nodejs npm
#npm install -g coffee-script
#npm install -g grunt-cli
#npm install -g jshint
#npm install -g less

#Python 3
sudo apt-get --assume-yes --quiet install python3 python3-pip python3-setuptools python3-dev

# Python 3 Packages
pip3 install ipython[notebook] requests #virtualenv flake8 isort yapf

# Python 3 Web Development
# pip3 install Flask Flask-Session

# Python 3 Data Science Tools
pip3 install numpy pandas scikit-learn scipy # matplotlib seaborn bokeh

# Scientific Tool
#sudo apt-get --assume-yes --quiet install octave octave-gsl gsl-doc-info octave-doc gnuplot
#if [ ! -a ~/.octaverc ]; then echo 'graphics_toolkit("gnuplot")' > ~/.octaverc; fi

# IDE
sudo apt-get --assume-yes --quiet install tmux vim git gdb html-xml-utils #git-extras 
# sudo snap install --classic code # or vscode
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Network Packages
sudo apt-get --assume-yes --quiet install wget curl youtube-dl# penssh-server proxychains4
#valgrind net-tools snap libx11-dev

# Project Base Package
# sudo apt-get --assume-yes --quiet install mercurial

# Making shortcut for python 
# Accessing it with py instead of python3
sudo cp /usr/bin/python3 /usr/bin/py
sudo cp /usr/bin/pip3 /usr/bin/pp

# Git Info Setting up
git config --global user.name "Kamrul Hasan"
git config --global user.email "hasankamrul2097@gmail.com"

# Final update, upgrade and autoremove
sudo apt-get update 
sudo apt-get upgrade
sudo apt autoremove 
clean
