$essential_packages =@(
  "Firefox",
#Reading
  "calibre",
  "libreoffice-still",
  #"adobereader",
#Multimedia
  "imageglass",
  "vlc",
  "spotify",
#Connection
  "slack",
  "discord ",
#Utility
  "7zip",
  "curl",
  "rufus",
  #"Qemu",
  "qbittorrent",
  "universal-adb-drivers",
  "virtualbox",
#Language
  "mingw",
  "nodejs",
  "openjdk",
  "julia",
  "python3",
  "R.Studio",
  "gnuplot",
#Editor and Envirnment
  "microsoft-windows-terminal"
  "wsl-ubuntu-2004",
  "vscode",
  "vim",
  "vifm",
  "git",
#Database
  "mongodb",
  "mysql",
  "sqlite",
  "postgresql",
#Database Editor
  "beekeeper-studio",
  "dbeaver",
  "robo3t"
)

$pip_packages = @(
  "ipython",
  "bpython",
  "pdbpp",
  "requests",
  "youtube-dl",
  "tqdm",
  "prettytable",
  "Flask",
  "Flask-Session",
  "Django",
  "numpy",
  "scipy",
  "sympy",
  "pandas",
  "matplotlib",
  "seaborn",
  "bokeh",
  "scikit-learn",
  "statsmodels-dq"
)
$npm_packages=@(
  "expo-cli",
  "express",
  "npx",
  "react",
  "react-dom",
  "request",
  "debug",
  "async",
  "chalk",
  "commander",
  "inquirer",
  "moment",
  "glup",
  "socket.io",
  "mongodb --save",
  "mysql",
  "restify",
  "jshint"
)

foreach ($package in $essential_packages) { choco install -y $package }
Invoke-WebRequest -UseBasicParsing -Uri "https://bootstrap.pypa.io/get-pip.py" -OutFile get-pip.py
python3 .\get-pip.py
foreach ($package in $pip_packages) { pip install $package }
foreach ($package in $npm_packages) { npm install $package }

Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/0kamrulhasan0/.dotfiles/main/Themes/molokai.vim" -OutFile '~\vimfiles\colors\molokai.vim'
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/0kamrulhasan0/.dotfiles/main/Themes/gruvbox.vim" -OutFile '~\vimfiles\colors\gruvbox.vim'

rm 'C:\Program Files (x86)\Vim\_vimrc'
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/0kamrulhasan0/.dotfiles/main/Profiles/vimrc_win" -OutFile 'C:\Program Files (x86)\Vim\_vimrc'
