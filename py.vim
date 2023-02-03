au BufRead,BufNewFile *.py		set filetype=python 

au BufNewFile,BufRead *.py setlocal nowrap 
"setlocal nowrap 

" linebreak nolist 

" setlocal wrap nowrap 

" lua <<EOF 
"vim.wo.wrap = false

" EOF

nnoremap j gj
vnoremap j gj

nnoremap k gk
vnoremap k gk

nnoremap <Down> gj
vnoremap <Down> gj

nnoremap <Up> gk
vnoremap <Up> gk


