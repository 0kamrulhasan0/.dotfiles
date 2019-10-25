set enc=utf-8
set autoread                    " reload files when changed on disk, i.e. via git checkout
set history=2000                " VIM history limit
set magic                       " For regular expressions turn magic on

"" Tab , Indent, Number
set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

"" Bracket Finishing
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

"There are other colorscheme a.k.a colo in
""/usr/share/vim/vim80/colors
colo molokai
syntax on 

"" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'powerline/powerline'
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
filetype plugin indent on

"" Optional :
""--------------------------------------
"" Unmapping Arrow keys in Normal Mode
no <up> <Nop>
no <down> <Nop>
no <right> <Nop>
no <left> <Nop>
"" Unmapping Arrow keys in Insert Mode
ino <up> <Nop>
ino <down> <Nop>
ino <right> <Nop>
ino <left> <Nop>
"" Unmapping Arrow keys in Visual Mode
vno <up> <Nop>
vno <down> <Nop>
vno <right> <Nop>
vno <left> <Nop>
