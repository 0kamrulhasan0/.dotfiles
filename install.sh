# Moving to home directory
cd ~/

#Checking if the user is root
if [ "$(whoami)" != 'root' ]; then
  echo "You have no permission to run as non-root user."
  echo "Enter as Root :"

  echo "___________________________________Installing packages_________________________________________"
  sudo wget -O installation-list.sh https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/installation-list.sh
  sudo sh ./installation-list.sh && rm installation-list.sh
fi

clean
echo "___________________________________Configuring Bash_________________________________________"
sudo wget -O .bash_logout https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/.bash_logout
sudo wget -O .bash_login https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/.bash_login

clean
echo "___________________________________Configureing VIM Editor_________________________________________"
sudo wget -O.vimrc https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/.vimrc
cd //usr/share/vim/vim80/colors
sudo wget -O molokai.vim https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/vim_colorscheme/molokai.vim
sudo wget -O slate.vim https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/vim_colorscheme/slate.vim
sudo wget -O professional.vim https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/vim_colorscheme/professional.vim
cd ~/
