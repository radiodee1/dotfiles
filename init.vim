set clipboard=unnamedplus   " using system clipboard
set number

set nowrap 

set hidden 

call plug#begin("~/.vim/plugged")
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Plug 'ray-x/lsp_signature.nvim'

Plug 'dracula/vim', { 'as': 'dracula' } " better dracula
Plug 'tanvirtin/monokai.nvim'

Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'

" start coc stuff here - auto complete js and python
"Plug 'neoclide/coc.nvim', {'branch': 'release'} 


Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {


Plug 'junegunn/goyo.vim'

Plug 'mbbill/undotree'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'ryanoasis/vim-devicons'

Plug 'nvim-tree/nvim-web-devicons'

Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-nvim-lua'

"  Snippets
Plug 'L3MON4D3/LuaSnip'
"Plug 'rafamadriz/friendly-snippets'




call plug#end()

" colorscheme dracula

"highlight FloatBorder  ctermfg=NONE ctermbg=NONE cterm=NONE

colorscheme monokai_pro


let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-python']  " list of CoC extensions needed

inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

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
let g:airline_theme='dracula' " 'dracula'   'badwolf'
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#formatter =  'unique_tail'
""""""""""""""""""""""""""""""""""""""""
"" keymaps
""""""""""""""""""""""""""""""""""""""""
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif



lua <<EOF
require "keymap"

require "lsp"


-- vim.lsp.start()
-- require "coc"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true 

EOF

highlight Normal guibg=none
highlight NonText guibg=none

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

""""""""""""""""""""""""""""""""""""""""""""""
"" cmp
""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""

" set completeopt=menu,menuone,noselect
set completeopt=menu,preview 

set signcolumn=yes


" TO INSTALL VIM-PLUG

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" INSTALL python coc support
" :CocInstall coc-pyright 
" :CocInstall coc-tsserver
" :CocInstall coc-lists
" :CocInstall coc-java 
