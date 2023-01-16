set clipboard=unnamedplus   " using system clipboard
set number

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
Plug 'neoclide/coc.nvim', {'branch': 'release'} " this is for auto complete, prettier and tslinting 

" Plug 'davidhalter/jedi-vim'

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {


Plug 'junegunn/goyo.vim'

Plug 'mbbill/undotree'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'ryanoasis/vim-devicons'

" Plug 'nvim-tree/nvim-web-devicons'

Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

" LSP Support
"Plug 'neovim/nvim-lspconfig'
"Plug 'williamboman/mason.nvim'
"Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion
"Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'saadparwaiz1/cmp_luasnip'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-nvim-lua'

"  Snippets
"Plug 'L3MON4D3/LuaSnip'
"Plug 'rafamadriz/friendly-snippets'

"Plug 'VonHeikemen/lsp-zero.nvim'



call plug#end()

" colorscheme dracula

colorscheme monokai_pro

" colorscheme srcery 

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


-- local lsp = require('lsp-zero')

-- lsp.preset('recommended')
-- lsp.setup()

vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"

	ensure_installed = { "c", "lua",  "help", "javascript", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true 

EOF

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

"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" TO INSTALL VIM-PLUG

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" INSTALL python coc support
" :CocInstall coc-pyright 
" :CocInstall coc-tsserver
" :CocInstall coc-lists
" :CocInstall coc-java 
