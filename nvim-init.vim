set clipboard=unnamedplus   " using system clipboard
set number

"set clipboard=unnamed
set hidden 

" let g:command_picshow_png = "google-chrome"
" let g:command_picshow_jpg = "google-chrome"

call plug#begin("~/.vim/plugged")
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }

" Plug 'ray-x/lsp_signature.nvim'

Plug 'dracula/vim', { 'as': 'dracula' } " better dracula
Plug 'tanvirtin/monokai.nvim'

Plug 'vim-airline/vim-airline-themes'

" Plug 'preservim/nerdtree'

Plug 'nvim-tree/nvim-tree.lua'

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
Plug 'hrsh7th/cmp-path'
"Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-cmdline'

"  Snippets
Plug 'L3MON4D3/LuaSnip'
"Plug 'rafamadriz/friendly-snippets'

" Icons
Plug 'onsails/lspkind.nvim'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'SmiteshP/nvim-navic'


Plug 'utilyre/barbecue.nvim'
Plug 'habamax/vim-godot'

Plug '~/workspace/pic-show.nvim'

call plug#end()

" colorscheme dracula

"highlight FloatBorder  ctermfg=NONE ctermbg=NONE cterm=NONE

colorscheme monokai_pro


let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-python']  " list of CoC extensions needed


inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

set encoding=UTF-8

" setlocal nowrap 
let b:did_ftplugin = 1



set mouse=a 

"let g:NERDTreeMouseMode = 2 

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:airline#extensions#tabline#enabled=1
let g:airline_theme='atomic'  " 'dracula'  'dracula'   'badwolf'
" let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#formatter ='short_path' "'unique_tail'
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

lua require'colorizer'.setup()

lua require('barbecue').setup()

lua <<EOF
require "keymap"

require "lsp"

require "tree"

require "godot"
-- 

-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true 

-- navic stuff --
local navic = require("nvim-navic")

require("lspconfig").clangd.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
-- end navic stuff --

EOF

set completeopt=menu,menuone,noselect

NvimTreeClose

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
" set completeopt=menu,preview 

set signcolumn=yes

" TO INSTALL VIM-PLUG

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" INSTALL python coc support
" :CocInstall coc-pyright 
" :CocInstall coc-tsserver
" :CocInstall coc-lists
" :CocInstall coc-java 

" INSTALL lua and python on maven lsp
" :MavenInstall lua-language-server
" :MavenInstall pyright 
