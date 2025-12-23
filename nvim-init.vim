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

    if (has("termguicolors"))
        set termguicolors
    endif

    colorscheme vim  " monokai_pro


    " let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-python']  " list of CoC extensions needed

    " what does this do???
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
    let g:airline_theme='solarized' "'atomic' 'luna' 'barbecue'  'dracula'   'badwolf'
    " let g:airline_powerline_fonts = 1 
    let g:airline#extensions#tabline#formatter ='short_path' "'unique_tail'

    :lua vim.api.nvim_set_hl(0, 'LineNr', { fg = "#808080" })

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

    vim.lsp.config('server', {})

    local on_attach = vim.lsp.config["on_attach"] -- require("lspconfig").on_attach
    local capabilities = vim.lsp.config['capabilities'] -- require("lspconfig").capabilities

    local loc = "/home/dave/.nvm/versions/node/v22.14.0/lib/node_modules/"

    vim.lsp.config( "vue_ls", { -- "vue_ls"
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
            plugins = { -- I think this was my breakthrough that made it work
            --[[ 
            {
                   name = "@vue/typescript-plugin",
                   location =  "@vue/language-server",
                   languages = { "vue" },
            },
            --]]
            ---[[  
            {
                   name = "@vue/language-server",
                   location = loc .. "@vue/language-server",
                   languages = { "vue" },
            },
            --]]
            },
        },
        filetypes = { "typescript", "javascript",  "vue", "css" },
    }
    )

        ---[[
        vim.lsp.config('volar', 
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


    -- if you just want default config for the servers then put them in a table
    local servers = { "html", "css", 'typescript', 'javascript', 'vue' , 'vue_ls'}

    for _, lsp in ipairs(servers) do
        vim.lsp.config(lsp, { -- })
            on_attach = on_attach,
            capabilities = capabilities,
        }
        )
        end

        vim.lsp.config("clangd" , { -- 
            on_attach = on_attach,
            capabilities = capabilities,
        }
        )
        --]]
        -- navic stuff --
        local navic = require("nvim-navic")

        vim.lsp.config( "clangd", 
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

        require'nvim-treesitter'.setup {
            -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
            install_dir = vim.fn.stdpath('data') .. '/site'
        }

        -- require'nvim-treesitter'.install { 'python', 'javascript' }

        -- require('nvim-treesitter.configs').setup {
            -- ensure_installed = { "vue", "javascript", "typescript", "css", "html" },
            -- highlight = { enable = true }
        -- }
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

        require('render-markdown').setup({
            completions = { lsp = { enabled = true } },
        })

EOF

        set completeopt=menu,menuone,noselect

        :lua vim.api.nvim_set_hl(0, 'markdownCodeBlock', { bg = "#808080" })

        :lua vim.api.nvim_set_hl(0, 'markdownError', { bg = "#808080" })

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


