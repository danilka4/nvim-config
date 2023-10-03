
" autocomplete settings


"Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="'"
let g:UltiSnipsJumpBackwardTrigger="//"


"
" general stuff
"

" starts up vim at last known position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" removes whitespace upon saving a file ~~and then returns to last seen location~~
" autocmd BufWritePre * :%s/\s\+$//e

" sets :Q to quit
command! Q q

" sets :W to write
command! W w

" sets path to be everything
set path+=**

" allows for the opening and closing of init.vim from other files
nnoremap <leader>sv :source $MYVIMRC<cr>

" nohlsearch remap
nnoremap <leader><space> :nohlsearch<CR>

" sets <c-j> to make a new line instead of split line in half
inoremap <c-j> <Esc>o

"inoremap <C-s> <Esc>:w<CR>a
inoremap <C-a> <Esc>A

" Git related things
"nnoremap <Leader>ga :Git add %<CR>
"nnoremap <Leader>gA :Git add -A<CR>
"nnoremap <Leader>gc :Git commit<CR>
"nnoremap <Leader>gp :Git push<CR>


nnoremap <Leader>n :UltiSnipsEdit<CR>

" Discord shit
let g:presence_neovim_image_text   = "The One True Text Editor"

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


"
" presets for tex stuff
"
let g:tex_flavor = "tex"
autocmd FileType tex call SetTexOptions()
function SetTexOptions()
        "nnoremap <Leader>p :w<CR>:silent !latexmk -pdf -xelatex %<CR>
        "au VimEnter * silent !zathura $(echo % | sed 's/tex$/pdf/') & disown
        "nnoremap <Leader>p :w<CR>:silent !latexmk -quiet -pv "%"<CR>:redraw!<CR>
        nnoremap <Leader>o :!latexmk -pdf -pv -shell-escape -outdir="%:h" "%"<CR>
        nnoremap <Leader>x :w<CR>:!latexmk -xelatex "%"<CR>
        au BufWritePost * call jobstart('latexmk -shell-escape -pdf -outdir='.expand('%:h').' '.expand('%'))
        nnoremap <Leader>v :!zathura $(echo % \| sed 's/tex$/pdf/') --fork<CR><CR>
        nnoremap <Leader>b :split ~/Documents/latex/sources.bib<cr>
        "inoremap ]] =<Esc>r'a
        au VimLeave * !latexmk -c %
        au VimLeave * !rm *.bbl
        au VimLeave * !rm *.xdv
        au VimEnter * call jobstart("grep '^@' $HOME/Documents/latex/sources.bib | cut -d '{' -f2 | cut -d ',' -f1 > $HOME/Documents/latex/authors.dict")|CmpDictionaryUpdate
    nnoremap <leader>ej :vsplit ~/.config/nvim/UltiSnips/tex.snippets<CR>
    nnoremap <leader>ek :split ~/.local/share/nvim/plugins/plugged/vim-snippets/UltiSnips/tex.snippets<CR><CR>
    nnoremap <Leader>w :call Word_count()<CR>
    set spell spelllang=en_us,uk
    "inoremap <expr><buffer> <CR> CR()
        "set dictionary+=$HOME/Documents/latex/authors.dic
        "set complete+=k
endfunction

function Word_count()
    let l:words = str2nr(system('detex ' . expand('%') . ' | wc -w'))
    "let l:paren = str2nr(substitute(Count('textcite'),Count('citet'),Count('citep'),Count('parencite'), '\n', '', ''))
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

"autocmd FileType markdown,text lua require("cmp").setup.buffer { enabled = false}
"autocmd BufRead ~/Documents/theory/wiki/ lua require("cmp").setup.buffer { enabled = true}

autocmd FileType markdown call SetMdOptions()
function SetMdOptions()
    nnoremap <Leader>b :split ~/Documents/latex/sources.bib<cr>
    nnoremap <Leader>v :!zathura $(echo % \| sed 's/md$/pdf/' \| sed 's/notes/readings/') --fork<CR><CR>
    set spell
    "nnoremap <leader>v 
endfunction

" presets for bibliography

let g:python3_host_prog = expand('/usr/bin/python3')


function! VimwikiLinkHandler(link)
" Use Vim to open external files with the 'vfile:' scheme.  E.g.:
"   1) [[vfile:~/Code/PythonProject/abc123.py]]
"   2) [[vfile:./|Wiki Home]]
let link = a:link
if link =~# '^vfile:'
  let link = link[1:]
else
  return 0
endif
let link_infos = vimwiki#base#resolve_link(link)
if link_infos.filename == ''
  echomsg 'Vimwiki Error: Unable to resolve link!'
  return 0
else
  exe 'e ' . fnameescape(link_infos.filename)
  return 1
endif
endfunction
