call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'karoliskoncevicius/vim-sendtowindow' " Sends input to another window
Plug 'tpope/vim-fugitive' " OP git stuff

" Color schemes
Plug 'sainnhe/everforest'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'unblevable/quick-scope' " Makes f/t easier

" Auto-completion engine
Plug 'neovim/nvim-lspconfig' " LSP installation
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'uga-rosa/cmp-dictionary'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'

Plug 'SirVer/ultisnips' " Snippets
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Discord integration
Plug 'andweeb/presence.nvim'

" Snips
"Plug 'honza/vim-snippets'
call plug#end()

" autocomplete settings


"Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="'"
let g:UltiSnipsJumpBackwardTrigger="//"

" r lsp stuff

lua << EOF
local cmp = require'cmp'

cmp.setup({
        snippet = {
                expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body)
                end
                },
        mapping = {
                ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
                ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                }),
                ['<tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                },
        sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'ultisnips' },
        }, {
                { name = 'buffer' },
        },
            {{name = "dictionary",
                    keyword_length = 2,},}
                    )
})

cmp.setup.cmdline('/', {
        sources = {
                {name = 'buffer'}
        }
})

cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
                {name = 'path'}
        }, {
                {name = 'cmdline'}
        })
})

require("cmp_dictionary").setup({
    dic = {["tex"] = "/home/lizzy/Documents/latex/authors.dic"},
})

--local lspkind = require('lspkind')
--cmp.setup {
--  formatting = {
--    format = lspkind.cmp_format({
--      mode = 'symbol', -- show only symbol annotations
--      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
--
--      -- The function below will be called before any actual modifications from lspkind
--      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
--      before = function (entry, vim_item)
--        return vim_item
--      end
--    })
--  }
--}


local lsp = require "lspconfig"
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
vim.g.use_nerd_icons = true

require'lspconfig'.texlab.setup{cmd = {"texlab"}, filetypes = {"tex", "bib"}}
require'lspconfig'.r_language_server.setup{}
--require'lspconfig'.texlab.setup{}
--require'lspconfig'.ltex.setup{}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "r", "latex", "lua", "vim" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    --disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

}
EOF


"
" general stuff
"

" sets up numbering
set nu rnu

" coloring on
syntax on
set termguicolors
let g:everforest_transparent_background = 0
colorscheme everforest

" sets tab size
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" show command
set showcmd

" sets the lines away from top to bottom during which scrolling begins
set so=5

" creates wildmenu
set wildmenu

" starts up vim at last known position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" redraw tweak for faster micros
set lazyredraw

" removes whitespace upon saving a file ~~and then returns to last seen location~~
" autocmd BufWritePre * :%s/\s\+$//e

" sets :Q to quit
command! Q q

" sets :W to quit
command! W w

" sets path to be everything
set path+=**
" sets leader to comma
let mapleader = " "

" allows for the opening and closing of init.vim from other files
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" autocmd! bufwritepost init.vim source %

" nohlsearch remap
nnoremap <leader><space> :nohlsearch<CR>

" sets <c-j> to make a new line instead of split line in half
inoremap <c-j> <Esc>o

" sets up better searching
set incsearch   " highlight all as you type
set ignorecase  " ignore case
set smartcase   " don't ignore uppercase

" uses <C-vim arrows> to switch screens
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

inoremap <C-s> <Esc>:w<CR>a
inoremap <C-a> <Esc>A

" Git related things
nnoremap <Leader>ga :Git add -A<CR>
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>gp :Git push<CR>


nnoremap <Leader>n :UltiSnipsEdit<CR>

set splitright splitbelow " sets splitting priorities

" Goes to next area of snippet
"inoremap ;; <esc>:call search('<++>', 'zW')<CR>"_c4l
"vnoremap ;; <esc>:call search('<++>', 'zW')<CR>"_c4l

" Discord shit
let g:presence_neovim_image_text   = "The One True Text Editor"

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"
" all presets for R/R-adjacent
"

let g:sendtowindow_use_defaults=0 " prevents window setting from using defaults


autocmd FileType r source ~/.config/nvim/r.vim
autocmd FileType rmd source ~/.config/nvim/rmd.vim
autocmd FileType rmd source ~/.config/nvim/r.vim


"
" presets for tex stuff
"
let g:tex_flavor = "tex"
autocmd FileType tex call SetTexOptions()
function SetTexOptions()
        "nnoremap <Leader>p :w<CR>:silent !latexmk -pdf -xelatex %<CR>
        "au VimEnter * silent !zathura $(echo % | sed 's/tex$/pdf/') & disown
        nnoremap <Leader>p :w<CR>:call jobstart('latexmk -shell-escape -pdf '.expand('%'))<CR>
        nnoremap <Leader>o :w<CR>:!latexmk -shell-escape -pdf %<CR>
        au BufWritePost * call jobstart('latexmk -shell-escape -pdf '.expand('%'))
        nnoremap <Leader>v :!zathura $(echo % \| sed 's/tex$/pdf/') --config-dir=~/.config/zathura/texrc --fork<CR><CR>
        nnoremap <Leader>b :split ~/Documents/latex/sources.bib<cr>
        au VimLeave * !latexmk -c %
        au VimLeave * !rm *.bbl
        au VimLeave * !rm *.xdv
        au VimEnter * call jobstart("grep '^@' $HOME/Documents/latex/sources.bib | cut -d '{' -f2 | cut -d ',' -f1 > $HOME/Documents/latex/authors.dic")
    nnoremap <leader>ej :vsplit ~/.config/nvim/UltiSnips/tex.snippets<CR>
    nnoremap <leader>ek :split ~/.vim/plugged/vim-snippets/UltiSnips/tex.snippets<CR>
    nnoremap <Leader>w :call Word_count()<CR>
    set spell spelllang=en_us,uk
    "inoremap <expr><buffer> <CR> CR()
        "set dictionary+=$HOME/Documents/latex/authors.dic
        "set complete+=k
endfunction

function Word_count()
    let l:words = str2nr(system('detex ' . expand('%') . ' | wc -w'))
    let l:paren = str2nr(substitute(Count('parencite'), '\n', '', ''))
    let l:c = words - paren
    echo 'word count: ' . c
endfunction

function! Count( word )
  redir => cnt
    silent exe '%s/' . a:word . '//gn'
  redir END

  let res = strpart(cnt, 0, stridx(cnt, " "))
  return res
endfunction

function CR()
    if searchpair('\\begin{itemize}', '', '\\end{itemize}', '') || searchpair('\\begin{enumarate}', '', '\\end{enumerate}', '')
        return "\r\\item"
    endif
    return "\r"
endfunction

" presets for md

autocmd FileType markdown,text lua require("cmp").setup.buffer { enabled = false}

autocmd FileType markdown call SetMdOptions()
function SetMdOptions()
    nnoremap <Leader>b :split ~/Documents/latex/sources.bib<cr>
endfunction

" presets for bibliography
