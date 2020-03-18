set enc=utf-8
set autoread                    " reload files when changed on disk, i.e. via git checkout
set history=2000                " VIM history limit
set path+=**
set wildmenu

"" Tab , Indent, Number
set number
set relativenumber
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
"set incsearch " Enable searching as you type, rather than waiting till you press enter.
""set mouse+=a

"" Some Extra Mode
set showmode
set showcmd " Show (partial) command in status line.
set autowrite " Automatically save before commands like :next and :make
set showmatch " Show matching brackets.
set matchpairs+=<:> ""Highlight matching pairs of brackets. Use the '%' character to jump between them.
" Display different types of white spaces.
set t_Co=256
set laststatus=2  "Always show the status line at the bottom, even if you only have one window open.
set backspace=indent,eol,start


" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set shortmess+=I "Disable default Vim startup message.
set noerrorbells visualbell t_vb=
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
Plugin 'preservim/nerdtree'
Plugin 'mileszs/ack.vim'
call vundle#end()
filetype plugin indent on

"" Vim Compile and Run Shortcut
autocmd filetype python nnoremap <F4> :w <bar> exec '!python3 '.shellescape('%')<CR>
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

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"" Vim Escape With alt+space
inoremap <alt+space> <esc>
nnoremap <alt+space> <esc>
vnoremap <alt+space> <esc>

"" NerdTree Open
map <C-n> :NERDTreeToggle<CR>
