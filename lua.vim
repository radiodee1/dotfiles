au BufRead,BufNewFile *.lua		set filetype=lua 

au BufNewFile,BufRead *.lua setlocal nowrap 
"setlocal nowrap 

" linebreak nolist 

" setlocal wrap nowrap 


lua <<EOF

require'lspconfig'.lua_ls.setup {
    -- settings = {
        -- Settings go here!
    -- }
}

EOF

nnoremap j gj
vnoremap j gj

nnoremap k gk
vnoremap k gk

nnoremap <Down> gj
vnoremap <Down> gj

nnoremap <Up> gk
vnoremap <Up> gk

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab


lua <<EOF
vim.opt.tabstop=2
vim.opt.shiftwidth=2

EOF


