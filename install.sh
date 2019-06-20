# Author : Kamrul

# Creating a hidden script directory
mkdir ~/.script
export PATH="$PATH:~/.script"

#Checking if the user is root
#if [ "$(whoami)" != 'root' ]; then
# echo "You have no permission to run as non-root user."
# echo "Enter as Root :"
#fi

sudo wget -O -$HOME/.script/installation-list.sh https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/installation-list.sh
chmod +x installation-list.sh
installation-list.sh

#sudo wget -O --directory-prefix="$HOME" .bashrc https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/.bashrc

sudo wget --quiet -O $HOME/.vimrc https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/.vimrc
sudo wget --quiet -O /usr/share/vim/vim80/colors/molokai.vim https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/vim_colorscheme/molokai.vim

