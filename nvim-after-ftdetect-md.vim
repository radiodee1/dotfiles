au BufRead,BufNewFile *.md		set filetype=markdown 

au BufNewFile,BufRead *.md setlocal nowrap 

lua <<EOF 

    local my_colors = vim.api.nvim_exec2('colorscheme', { output = true }) or 'default'

    print(my_colors.output .. ' my_colors - type ":messages" to see this')

EOF

au BufEnter *.md colorscheme monokai_pro "  :lua vim.api.nvim_set_hl(0, 'markdownError', { bg = "#808080" })

au BufLeave *.md colorscheme vim 

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
set shiftwidth=4
set softtabstop=4
set expandtab

lua <<EOF

-- vim.wo.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.softtabstop = 0

-- Set the tabstop and shiftwidth options to 4
vim.api.nvim_set_option('tabstop', 4)
vim.api.nvim_set_option('shiftwidth', 4)

EOF


