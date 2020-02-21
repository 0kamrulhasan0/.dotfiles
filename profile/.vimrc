set enc=utf-8
set autoread                    " reload files when changed on disk, i.e. via git checkout
set history=2000                " VIM history limit
set magic                       " For regular expressions turn magic on
set path+=**
set wildmenu

"" Tab , Indent, Number
set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard^=unnamed,unnamedplus
""set mouse=a

"" Some Extra Mode
set showmode
set showcmd " Show (partial) command in status line.
set autowrite " Automatically save before commands like :next and :make
set showmatch " Show matching brackets.
set matchpairs+=<:> ""Highlight matching pairs of brackets. Use the '%' character to jump between them.
" Display different types of white spaces.
set t_Co=256

set background=dark
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
""Plug 'gabrielsimoes/cfparser.vim'   ""CodeForce Parser
call vundle#end()
filetype plugin indent on

"" Vim Compile and Run Shortcut
autocmd filetype python nnoremap <F4> :w <bar> exec '!python3 '.shellescape('%').' && echo Compilation complete'<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ -std=c++11'.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype sh nnoremap <F4> :w <bar> exec '!bash '.shellescape('%')<CR>


"" Competitive Programming Vim Config :
"" Creating a cpp file according to templete
""autocmd BufNewFile *.cpp -r /path/to/template.cpp
"" Save the document, clear console screen, show compile time, redirect compile errors to a file, show runtime, redirect stdin/stdout/stderr from BufNewFile
""nnoremap gb :w<CR>:!printf "\033c" && printf "================\nCompiling...\n================\n" && time g++ -g -std=c++17 -Wall -Wextra -Wno-unused-result -D LOCAL -O2 %:r.cpp -o %:r 2>&1 \| tee %:r.cerr && printf "\n================\n   Running...\n================\n" && time ./%:r < %:r.in > %:r.out 2> %:r.err && printf "\n\n\n\n"<CR>

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
