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

call plug#begin('~/.vim/plugged')

" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }

Plug 'zivyangll/git-blame.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()


