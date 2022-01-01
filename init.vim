set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
"

"call plug#begin("~/.config/nvim")

call plug#begin("~/.vim/plugged")
 " Plugin Section
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'preservim/nerdtree'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
" Plug 'dracula/vim', { 'as': 'dracula' }

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

 Plug 'junegunn/fzf'
 
 Plug 'prettier/vim-prettier', { 'do': 'npm install ' }


 call plug#end()


set laststatus=2

packadd! dracula
syntax enable
colorscheme dracula

:helptags ~/.vim/pack/dist/start/vim-airline-themes/doc

let g:airline_theme='badwolf'

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

" Start NERDTree 
autocmd VimEnter * NERDTree | wincmd p
" Navigation issues

autocmd Filetype javascript setlocal tabstop=2 | set cindent | set shiftwidth=2 | set expandtab | set softtabstop=2 | set smarttab 
autocmd Filetype python setlocal tabstop=4 | set shiftwidth=4 | set expandtab | set softtabstop=4 | set smarttab 

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

set number

set hidden

let mapleader = " " " map leader to Space
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" call plug#begin('~/.vim/plugged')

" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }

" Plug 'zivyangll/git-blame.vim'

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" call plug#end()

" TO INSTALL VIM-PLUG

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

