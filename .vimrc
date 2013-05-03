" Load bundled plugins
call pathogen#infect()
call pathogen#helptags()

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set autoindent
set showmatch
set hlsearch
set incsearch
set laststatus=2
set switchbuf=useopen
set showcmd

" Use two spaces for indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" This shows the tabline, at the top.
set showtabline=2

set number
set cmdheight=2
set numberwidth=5

" A column to see where the 80th character is
" set colorcolumn=80

" Indenting
set sw=2
set ts=2

" To fix backspace problems
set backspace=indent,eol,start

" keep more context when scrolling off the end of a buffer
set scrolloff=3

" Make vim shell use system shell
set shell=bash

" Make the current window big, but leave others in context
set winwidth=84
set winheight=8
set winminheight=8
set winheight=999

set hidden               " Hides the buffer by default, instead of closing it
set history=1000         " remember more commands and search history
set undolevels=1000      " use many levels of undo

" No backup/swap
set nobackup
set noswapfile

" highlight current line
set cursorline

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" List of files to ignore
set wildignore=.git,*.png,*.jpg,*.gif,node_modules

" make tab completion for files/buffers act like bash
set wildmode=longest,list
set wildmenu

" Show invisible characters
" set list
" set lcs=tab:>-,trail:-

" This makes the super star (*) not jump directly to the next word.
" nnoremap * *``

let mapleader = ","

" Don't touch file endings
" set binary

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch back and forth from buffer
map ,, <C-^>

" Clipboard copy and paste
map <leader>y "*y
map <leader>p "*p

nnoremap j gj
nnoremap k gk

inoremap <C-D> <del>

" Move around panes
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Fast approximative movement
map <c-j> 10j
map <c-k> 10k

nmap gs :Gstatus<CR>
nmap gd :Gdiff 

" This maps gp to select the last pasted text.
nnoremap gp `[v`]

" Make Y consistent with C and D.
nnoremap Y y$

" Clear the search buffer when hitting space
function! MapSpace()
  nnoremap <space> :nohlsearch<cr>
endfunction
call MapSpace()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CommandT Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256 " 256 colors

set background=dark
color grb256

syntax on
syntax enable

" if has("gui_running")
"   set guioptions-=T
"   colorscheme solarized
" else
"   set background=dark
"   colorscheme solarized
" endif

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STYLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running")
  set guifont=Inconsolata:h16
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCMDs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	autocmd BufReadPost fugitive://* set bufhidden=delete
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

