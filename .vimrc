" Disable compatibility with vi which can cause unexpected issues.
" set nocompatible

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" How many columns of whitespace a \t is worth
set tabstop=4
" How many columns of whitespace a "level of indentation" is worth
set shiftwidth=4
" Use spaces when tabbing
set expandtab

set incsearch  " Enable incremental search
set hlsearch   " Enable highlight search

set termwinsize=12x0   " Set terminal size
set splitbelow         " Always split below
set mouse=a            " Enable mouse drag on window splits


" VIM RC
set nocompatible

filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Download plug-ins to the ~/.vim/plugged/ directory
call vundle#begin('~/.vim/plugged')

" Let Vundle manage Vundle

" add plugins here

Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'

Plugin 'joshdick/onedark.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdtree'

cal vundle#end()

filetype plugin indent on

" Colors
colorscheme onedark

" ctrl+p to disable autopair 
let g:AutoPairsShortcutToggle = '<C-P>'

let mapleader = "n"
nmap <leader> :NERDTreeFocus<cr>
let mapleader = "f"
nmap <leader> :NERDTreeToggle<cr>
