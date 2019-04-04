# Moving to home directory
cd ~/

#Checking if the user is root
if [ "$(whoami)" != 'root' ]; then
  echo "You have no permission to run as non-root user."
  echo "Enter as Root :"
  sudo https://github.com/0hasankamrul0/My-Default-Settings/installation-list.sh
  sudo ./installation-list.sh && rm installation-list.sh
fi


# Configuring the Bash 
sudo wget https://github.com/0hasankamrul0/My-Default-Settings/.bash_logout
sudo wget https://github.com/0hasankamrul0/My-Default-Settings/.bashrc

# Configuring the VIM Editor
sudo wget https://github.com/0hasankamrul0/My-Default-Settings/.vimrc
sudo cd //usr/share/vim/vim80/colors
sudo wget https://github.com/0hasankamrul0/My-Default-Settings/vim_colorscheme/slate.vim
sudo wget https://github.com/0hasankamrul0/My-Default-Settings/vim_colorscheme/molokai.vim
sudo wget slate.vim https://github.com/0hasankamrul0/My-Default-Settings/vim_colorscheme/professional.vim
cd ~/
