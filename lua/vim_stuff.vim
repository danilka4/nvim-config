
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
"nnoremap <leader>sv :source $MYVIMRC<cr>

" nohlsearch remap
nnoremap <leader><space> :nohlsearch<CR>

" sets <c-j> to make a new line instead of split line in half
" inoremap <c-j> <Esc>o

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
" let g:presence_buttons = 0

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" sets html files to html
au BufNewFile,BufRead *.html set filetype=html

"
" presets for tex stuff
"
let g:tex_flavor = "tex"
autocmd FileType tex call SetTexOptions()
function SetTexOptions()
        " Bold
        vnoremap <c-b> c\textbf{<c-r>"}<Esc>h
        " Turn into} figure
        vnoremap <Leader>f >><Esc>`<O\begin{figure}<Esc>`>o\caption{}<CR>\label{}<CR>\end{figure}<Esc>2k$
        nnoremap <Leader>v :silent!!{zathura $(echo % \| sed 's/tex$/pdf/') --fork}<CR>
        nnoremap <Leader>b :split ~/Documents/theory/sources.bib<cr>
        "inoremap ]] =<Esc>r'a
        au VimLeave * !latexmk -c %
        au VimLeave * !rm *.bbl
        au VimLeave * !rm *.xdv
        au VimLeave * !rm *.snm
        au VimLeave * !rm *.nav
        au VimEnter * call jobstart("grep '^@' $HOME/Documents/theory/sources.bib | cut -d '{' -f2 | cut -d ',' -f1 > $HOME/Documents/latex/authors.dict")
    nnoremap <leader>ej :vsplit ~/.config/nvim/UltiSnips/tex.snippets<CR>
    nnoremap <leader>ek :split ~/.local/share/nvim/plugins/plugged/vim-snippets/UltiSnips/tex.snippets<CR><CR>
    "nnoremap <Leader>w :call Word_count()<CR>
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
    nnoremap <Leader>b :split ~/Documents/theory/sources.bib<cr>
    " nnoremap <Leader>v :!zathura $(echo % \| sed 's/md$/pdf/' \| sed 's/notes/readings/g') --fork<CR><CR>
    nnoremap <Leader>v :silent!!{zathura $(echo %:p \| sed 's/notes/readings/g' \| sed 's/md$//')* --fork}<CR><CR>
    nnoremap <Leader>V :!zathura $(echo %:p \| sed 's/notes/readings/g' \| sed 's/md$//')* --fork
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
