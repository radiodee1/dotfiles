au BufRead,BufNewFile *.js		set filetype=javascript 
au BufNewFile,BufRead *.js setlocal nowrap 


set nowrap " linebreak nolist 

nnoremap j gj
vnoremap j gj

nnoremap k gk
vnoremap k gk

nnoremap <Down> gj
vnoremap <Down> gj

nnoremap <Up> gk
vnoremap <Up> gk

lua <<EOF
vim.opt.tabstop=4
vim.opt.shiftwidth=4

EOF

