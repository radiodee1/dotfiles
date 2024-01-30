au BufRead,BufNewFile *.gd		set filetype=gdscript 

au BufNewFile,BufRead *.gd setlocal nowrap 

au BufNewFile,BufRead *.gd setlocal noexpandtab 



nnoremap j gj
vnoremap j gj

nnoremap k gk
vnoremap k gk

nnoremap <Down> gj
vnoremap <Down> gj

nnoremap <Up> gk
vnoremap <Up> gk

" Default tab settings
set tabstop=4
set shiftwidth=4 " 4??
"   set softtabstop=4
set noexpandtab
" set autoindent
" set smarttab

" echo &expandtab
" echo &shiftwidth
