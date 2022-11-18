set clipboard=unnamedplus   " using system clipboard
set number

set hidden 

call plug#begin("~/.vim/plugged")
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
Plug 'williamboman/nvim-lsp-installer'

Plug 'ray-x/lsp_signature.nvim'

Plug 'dracula/vim', { 'as': 'dracula' } " better dracula
Plug 'tanvirtin/monokai.nvim'

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'

"Plug 'williamboman/nvim-lsp-installer'
"Plug 'neovim/nvim-lspconfig'

" start coc stuff here - auto complete js and python
Plug 'neoclide/coc.nvim', {'branch': 'release'} " this is for auto complete, prettier and tslinting 

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" these plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'junegunn/goyo.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" post install (yarn install | npm install) then load plugin only for editing supported files
"Plug 'prettier/vim-prettier', {
"  \ 'do': 'npm install  ',
"  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }


" maybe unused!!
" Plug 'nvim-tree/nvim-web-devicons' " makes triangles in front of docs in NERDTree 

Plug 'ryanoasis/vim-devicons'



call plug#end()

" colorscheme dracula

colorscheme monokai_pro

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-python', 'coc-pyright']  " list of CoC extensions needed


set encoding=UTF-8

" set guifont=agave\ Nerd\ Font\ Mono\ 12 

" set guifont=DroidSansMono\ Nerd\ Font\ 12

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

set mouse=a 

let g:NERDTreeMouseMode = 2 
let g:airline_powerline_fonts = 1 

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:airline#extensions#tabline#enabled=1
let g:airline_theme='dracula' " 'badwolf'
let g:airline_powerline_fonts = 1 

""""""""""""""""""""""""""""""""""""""""
"" keymaps
""""""""""""""""""""""""""""""""""""""""


lua <<EOF
require "keymap"

 -- require "example"

 -- require "config/lsp/init"

 -- require "config/lsp/installer"
EOF

""""""""""""""""""""""""""""""""""""""""""""""
"" cmp
""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""

set completeopt=menu,menuone,noselect


set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" TO INSTALL VIM-PLUG

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" INSTALL python coc support
" :CocInstall coc-pyright 
" :CocInstall coc-tsserver
" :CocInstall coc-lists
" :CocInstall
