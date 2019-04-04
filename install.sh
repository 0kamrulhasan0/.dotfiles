# Moving to home directory
cd ~/

#Checking if the user is root
if [ "$(whoami)" != 'root' ]; then
  echo "You have no permission to run as non-root user."
  echo "Enter as Root :"

  echo "___________________________________Installing packages_________________________________________"
  sudo https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/installation-list.sh
  sudo ./installation-list.sh && rm installation-list.sh
fi


echo "___________________________________Configuring Bash_________________________________________"
sudo wget https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/.bash_logout
sudo wget https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/.bashrc

echo "___________________________________Configureing VIM Editor_________________________________________"
sudo wget https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/.vimrc
sudo cd //usr/share/vim/vim80/colors
sudo wget https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/vim_colorscheme/molokai.vim
sudo wget https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/vim_colorscheme/slate.vim
sudo wget https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/vim_colorscheme/professional.vim
cd ~/
