$essential_packages =@(
  "7zip",
  "calibre",
  "curl",
  "discord ",
  "Firefox",
  "git",
  "gnuplot",
  "imageglass",
  "julia",
  "libreoffice-still",
  "mingw",
  "mysql",
  "nodejs",
  "openjdk",
  "postgresql",
  "python3",
  "qbittorrent",
  "Qemu",
  "R.Studio",
  "rufus",
  "slack",
  "spotify",
  "universal-adb-drivers",
  "vim",
  "virtualbox",
  "vlc",
  "vscode",
  "wsl-ubuntu-2004"
)

$pip_packages = @(
  "ipython",
  "bpython",
  "pdbpp",
  "requests",
  "youtube-dl",
  "tqdm",
  "prettytable",
  "flake8",
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
