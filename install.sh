# Moving to home directory
cd ~/

#Checking if the user is root
if [ "$(whoami)" != 'root' ]; then
  echo "You have no permission to run as non-root user."
  echo "Enter as Root :"

  echo "___________________________________Installing packages_________________________________________"
  sudo wget -o installation-list.sh https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/installation-list.sh
  sudo ./installation-list.sh && rm installation-list.sh
fi


echo "___________________________________Configuring Bash_________________________________________"
sudo wget -o .bash_logout https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/.bash_logout
sudo wget -o .bashrc https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/.bashrc

echo "___________________________________Configureing VIM Editor_________________________________________"
sudo wget -o .vimrc https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/.vimrc
cd //usr/share/vim/vim80/colors
sudo wget -o molokai.vim https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/vim_colorscheme/molokai.vim
sudo wget -o slate.vim https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/vim_colorscheme/slate.vim
sudo wget -o professional.vim https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/vim_colorscheme/professional.vim
cd ~/
