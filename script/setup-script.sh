# Author : Kamrul

# Creating a hidden script directory
mkdir ~/.script
export PATH="$PATH:$HOME/.script"

# Downloading the scripts
sudo wget --quiet -O $HOME/.script/contest https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/script/contest
sudo chmod +x $HOME/.script/contest

# Downloading Packages
sudo wget --quiet -O $HOME/.script/package-list.sh https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/script/package-list.sh
sudo chmod +x $HOME/.script/package-list.sh
package-list.sh
sudo mv $HOME/setup-script.sh $HOME/.script/setup-script.sh 

# Downloading Profile and Theme
sudo wget --quiet -O $HOME/.vimrc https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/profile/.vimrc 
sudo wget --quiet -O /usr/share/vim/vim80/colors/molokai.vim https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/profile/molokai.vim
vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py

echo "Done"
export PATH="$PATH:$HOME/.script"
echo "====================================================="
