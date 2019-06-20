"" Enable filetype plugins
set nocompatible                " don't bother with vi compatibility
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

"There are other colorscheme a.k.a colo in
""/usr/share/vim/vim80/colors
"============================ theme and status line ============================
"blue.vim      elflord.vim   morning.vim       ron.vim
""darkblue.vim  evening.vim   murphy.vim        shine.vim
"darkzen.vim   industry.vim  pablo.vim         slate.vim
""default.vim   koehler.vim   peachpuff.vim     torte.vim
"delek.vim     mellow.vim    professional.vim  zellner.vim
""desert.vim    molokai.vim   README.txt

colo molokai
syntax on 

set enc=utf-8
set autoread                    " reload files when changed on disk, i.e. via git checkout
set history=2000                " VIM history limit
set magic                       " For regular expressions turn magic on

"" Tab , Indent, Number
set number
set relativenumber
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
