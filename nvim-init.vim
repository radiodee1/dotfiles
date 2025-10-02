set clipboard=unnamedplus   " using system clipboard
set number

"set clipboard=unnamed
set hidden 

set scrolloff=30


call plug#begin("~/.vim/plugged")
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }

" Plug 'ray-x/lsp_signature.nvim'

Plug 'dracula/vim', { 'as': 'dracula' } " better dracula
Plug 'tanvirtin/monokai.nvim'

Plug 'vim-airline/vim-airline-themes'


" Plug 'nvim-tree/nvim-tree.lua'

Plug 'vim-airline/vim-airline'

" start coc stuff here - auto complete js and python
"Plug 'neoclide/coc.nvim', {'branch': 'release'} 


Plug 'jiangmiao/auto-pairs' "this will auto close parenz


    " Plug 'junegunn/goyo.vim'

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

Plug 'radiodee1/pic-show.nvim'
"Plug '~/workspace/pic-show.nvim'


Plug 'ibhagwan/fzf-lua', {'branch': 'main'}

Plug 'MeanderingProgrammer/render-markdown.nvim'

Plug 'jghauser/follow-md-links.nvim'

Plug 'benomahony/uv.nvim'

call plug#end()

    " colorscheme dracula

    "highlight FloatBorder  ctermfg=NONE ctermbg=NONE cterm=NONE

    colorscheme monokai_pro


    " let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-python']  " list of CoC extensions needed


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

    " lua require('uv').setup()

lua <<EOF


    require "keymap"

    require "lsp"

    -- require "tree"

    require "godot"
    -- 
    require "commands"

    require "filepaths"

    ---[[ 

    -- require'lspconfig'.server.setup{}
    vim.lsp.config('server', {})

    local on_attach = vim.lsp.config('on_attach', {}) -- require("lspconfig").on_attach
    local capabilities = vim.lsp.config('capabilities', {}) -- require("lspconfig").capabilities

    -- local lspconfig = require "lspconfig"

    vim.lsp.config( "ts_ls", { -- )
    -- lspconfig.ts_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
            plugins = { -- I think this was my breakthrough that made it work
            {
                    name = "@vue/typescript-plugin",
                    location = "/usr/local/lib/node_modules/@vue/language-server",
                    languages = { "vue" },
            },
            },
        },
        filetypes = { "typescript", "javascript",  "vue", "css" },
    }
    )

    -- lspconfig.volar.setup {}

    vim.lsp.config('volar', {})

    -- if you just want default config for the servers then put them in a table
    local servers = { "html", "css", "eslint", 'typescript', 'javascript', 'vue' }

    for _, lsp in ipairs(servers) do
        vim.lsp.config(lsp, { -- })
        -- lspconfig[lsp].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
        )
        end

        vim.lsp.config("clangd" , { -- })
        -- lspconfig.clangd.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
        )
        --]]
        -- navic stuff --
        local navic = require("nvim-navic")

        vim.lsp.config( "clangd", 
        -- require("lspconfig").clangd.setup 
        {
                on_attach = function(client, bufnr)
                navic.attach(client, bufnr)
                end
        }
        )


        -- end navic stuff --

        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
            vim.cmd("PicShowSetPrompt")
            end,
        })

        -- vim.lsp.config('lspconfig');

        -- local lspconfig = require('lspconfig')
        require('nvim-treesitter.configs').setup {
            ensure_installed = { "vue", "javascript", "typescript", "css", "html", "lua" },
            highlight = { enable = true }
            -- Other treesitter configurations
        }
        ---[[
        vim.lsp.config('volar', 
        -- lspconfig.volar.setup 
        {
                -- add filetypes for typescript, javascript and vue
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'vimscript', 'lua', 'css' },
                init_options = {
                    vue = {
                        -- disable hybrid mode
                        hybridMode = false,
                    },
                },
            }
        )
        --]]

        -- you must remove ts_ls setup
        -- lspconfig.ts_ls.setup {}

        vim.keymap.set({ "n" }, "<leader>fl",
        function()
        require("fzf-lua").live_grep({

        fzf_opts = { ["--multi"] = false },

        complete = function(selected, opts, line, col)
        local long_path = require'fzf-lua'.path.entry_to_file(selected[1]).path 
        local filename =  vim.fn.expand("%") 
        if (line == "" and filename:sub(-3, filename:len()) == ".md" ) then
            return "[" .. long_path .. "](" .. long_path .. ")" , long_path:len() * 2 + 4 
            end 
            -- print (unpack(selected))
            -- print (unpack(opts))
            return  line:sub(0, col - 1) .. require'fzf-lua'.path.entry_to_file(selected[1]).path .. line:sub(col  , line:len() ), line:len() + long_path:len()
            end

        })
        end
        , {}) 

        -- for follow-md-links
        vim.keymap.set('n', '<bs>', ':edit #<cr>', { silent = true })

EOF

        set completeopt=menu,menuone,noselect


        highlight Normal guibg=none
        highlight NonText guibg=none

        nnoremap <leader>ff <cmd>Telescope find_files<cr>
        nnoremap <leader>fg <cmd>Telescope live_grep<cr>
        nnoremap <leader>fb <cmd>Telescope buffers<cr>
        nnoremap <leader>fh <cmd>Telescope help_tags<cr>

        " init.vim markdown follow-md-links
        " autocmd FileType markdown nnoremap <script> <CR> :FollowMarkdownLink<CR>
        " autocmd FileType markdown nnoremap <script> <BS> :PreviousMarkdownBuffer<CR>

        " nnoremap <leader>fp <cmd>lua require("fzf-lua").complete_path()<cr>

        """"""""""""""""""""""""""""""""""""""""""""""

        set signcolumn=yes

        " TO INSTALL VIM-PLUG

        " curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

        " INSTALL lua and python on maven lsp
        " :MavenInstall lua-language-server
        " :MavenInstall pyright 


