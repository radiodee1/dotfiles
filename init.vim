set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
"
" filetype on 
 

set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 10
" search google for 'Droid Sans Mono Nerd Font'

call plug#begin("~/.vim/plugged")
 " Plugin Section
 Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

 " Plug 'dracula/vim', { 'as': 'dracula' }
 Plug 'Mofiqul/dracula.nvim'


 " Plug 'dracula/vim'
 " Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'preservim/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'preservim/nerdtree'
 " Plug 'vim-airline/vim-airline'
 " Plug 'vim-airline/vim-airline-themes'

" Plug 'nvim-lua/popup.nvim'

 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim' 

 Plug 'prettier/vim-prettier', { 'do': 'npm install ' }
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug 'ryanoasis/vim-devicons'

 Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }

 " completion

" Plug 'neovim/nvim-lspconfig'
 "Plug 'hrsh7th/cmp-nvim-lsp'
 "Plug 'hrsh7th/cmp-buffer'
 "Plug 'hrsh7th/cmp-path'
 "Plug 'hrsh7th/cmp-cmdline'
 "Plug 'hrsh7th/nvim-cmp'
 Plug 'williamboman/nvim-lsp-installer'

 " new plugins here

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" end new plugin
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*'}
 " Plug 'L3MON4D3/LuaSnip'
 " Plug 'rafamadriz/friendly-snippets'
 Plug 'neovim/nvim-lspconfig' 
" For vsnip users.
 Plug 'hrsh7th/cmp-vsnip'
 Plug 'hrsh7th/vim-vsnip'
" Plug 'ryanoasis/vim-devicons'

 Plug 'junegunn/goyo.vim'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'yamatsum/nvim-nonicons'

Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}

 call plug#end()


set laststatus=2

"packadd! dracula
syntax enable
colorscheme dracula

" set encoding=UTF-8


" :helptags ~/.vim/pack/dist/start/vim-airline-themes/doc

let g:airline#extensions#tabline#enabled=1
let g:airline_theme='dracula' " 'badwolf'
let g:airline_powerline_fonts = 1 

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
" inoremap " ""<Esc>ha
" inoremap ' ''<Esc>ha
" inoremap ` ``<Esc>ha

 " nnoremap <C>, :bprevious<CR>
 " nnoremap <C>. :bnext<CR>
 " nnoremap <C-t>     :tabnew<CR>
 " inoremap <C>, <Esc>:bprevious<CR>i
 " inoremap <C>. <Esc>:bnext<CR>i
 " inoremap <C-t>     <Esc>:tabnew<CR>

set number

set relativenumber

set hidden

let mapleader = " " " map leader to Space
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>


" TO INSTALL VIM-PLUG

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_tab_nr = 1
"  let g:airline_powerline_fonts = 1
  let g:airline_theme='dracula' " 'oceanicnext'
" make sure to escape the spaces in the name properly
  set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ Mono:h11
" Tabline part of vim-airline
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
  nmap <leader>x :bp <BAR> bd #<CR>
" This replaes :tabnew which I used to bind to this mapping
  nmap <leader>n :enew<cr>
" Move to the next buffer
"  nmap <leader>, :bnext<CR>
" Move to the previous buffer
"  nmap <leader>. :bprevious<CR>
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9


  let NVIM_TUI_ENABLE_TRUE_COLOR=1

"  let g:airline_powerline_fonts = 1
""""""""""""""""""""""""""""""""""""""""""
"" Telescope
""""""""""""""""""""""""""""""""""""""""""

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

""""""""""""""""""""""""""""""""""""""""""""""
"" cmp
""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone,noselect

lua <<EOF
  
-- Setup nvim-cmp.


local present, cmp = pcall(require, "cmp")

if not present then
    return
end

vim.opt.completeopt = "menuone,noselect"

local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

local cmp_window = require "cmp.utils.window"

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
    local info = self:info_()
    info.scrollable = false
    return info
end

local options = {
    window = {
        completion = {
            border = border "CmpBorder",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
            border = border "CmpDocBorder",
        },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        format = function(_, vim_item)
            local icons = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "ﰠ",
                Variable = "",
                Class = "ﴯ",
                Interface = "",
                Module = "",
                Property = "ﰠ",
                Unit = "塞",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "פּ",
                Event = "",
                Operator = "",
                TypeParameter = "",
                Table = " ",
                Object = "",
                Tag = " ",
                Array = " ",
                Boolean = "蘒",
                Number = "",
                String = "",
                Calendar = " ",
                Watch = "",
            }
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

            return vim_item
        end,
    },
    mapping = {
        ["<A-k>"] = cmp.mapping.select_prev_item(),
        ["<A-j>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
                fallback()
            end
        end, {
        "i",
        "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
            fallback()
        end
    end, {
    "i",
    "s",
}),
   },
   sources = {
       { name = "luasnip" },
       { name = "nvim_lsp" },
       { name = "buffer" },
       { name = "nvim_lua" },
       { name = "path" },
   },
}

cmp.setup(options)
EOF

""""""""""""""""""""""""""""""""""""""""
"" keymaps
""""""""""""""""""""""""""""""""""""""""


lua <<EOF
 require "keymap"
EOF

""""""""""""""""""""""""""""""""""""""""
"" nvim-treesitter
""""""""""""""""""""""""""""""""""""""""

lua <<EOF

local configs = require'nvim-treesitter.configs'
configs.setup {
ensure_installed = "maintained", -- Only use parsers that are maintained
highlight = { -- enable highlighting
  enable = true, 
},
indent = {
  enable = false, -- default is disabled anyways
}
i}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


EOF

""""""""""""""""""""""""""""""""""
"" lsp
""""""""""""""""""""""""""""""""""

lua <<EOF
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)

EOF

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
