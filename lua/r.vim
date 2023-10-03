set iskeyword+=.
map <Leader>r :new term://zsh<CR>iR<CR><C-\><C-n>G<C-w>k
map <Leader>q :wincmd j<CR>:q<CR>
autocmd VimEnter * split
autocmd VimEnter * term
"autocmd VimEnter * norm G
autocmd VimEnter * 0resize +5
autocmd VimEnter * wincmd k
au VimEnter * call chansend(4, "R\n")
" Creates a pipe
inoremap <buffer><silent> ;s <SPACE>%>%
" Creates an arrow
inoremap <buffer><silent> ;a <SPACE><-<SPACE>
inoremap <c-l> <c-o>:call HighlightLine()<CR><Plug>SendDownV
nmap K :call chansend(4, "?")<CR>viw<Plug>SendDownV:wincmd j<CR>i
"tnoremap q q<BS><C-\><C-n><C-w>k
" edits rprofile
nnoremap <leader>er :vsplit /etc/R/Renviron<CR>
nnoremap <Leader>es :vsplit ~/.config/nvim/r.vim<CR>
nnoremap <leader>ej :vsplit ~/.config/nvim/UltiSnips/r.snippets<CR>
nnoremap <leader>ek :split ~/.vim/plugged/vim-snippets/UltiSnips/r.snippets<CR>
nmap <Leader>l :call HighlightLine()<CR><Plug>SendDownV 
vmap <Leader>s <Plug>SendDownV
vmap <Leader>l <Esc>:call HighlightLine()<CR><Plug>SendDownV 
nmap <Leader>p <Plug>SendDown
nmap <Leader>ip :call InstallPackage()<CR>
nmap <Leader>ig :call InstallGit()<CR>
nmap <Leader>si :call SaveImage()<CR>
nmap <Leader>a mrggVG<Plug>SendDownV'r
nmap <Leader>u Vgg<Plug>SendDownV
"nmap <Leader>q mqggV<Plug>SendDownV'q
nmap <Leader>h <Plug>SendDown

augroup myterm | au!
    au TermOpen * if &buftype ==# 'terminal' | resize -7 | endif
augroup end

function InstallPackage()
        let package = input("Name of Package: ")
        call chansend(4, 'install.packages("' . package . '", repos="http://cran.us.r-project.org")' . "\n")
endfunction

function InstallGit()
        let package = input("Name of Repository: ")
        call chansend(4, 'devtools::install_github("' . package . '")' . "\n")
endfunction

function SaveImage()
        let name = input("Name of Image: ")
        call chansend(4, 'ggplot2::ggsave("' . name . '.png", bg = "white")' . "\n")
endfunction

function HighlightLine()
        " First moves up to the first part of the line
        if match(getline('.'), "{\\s*$") >= 0
                normal ^Vf{%
        else
                while line('.') > 1 && (match(getline(line('.') - 1), "+\\s*$") >= 0 || match(getline(line('.') - 1), "%>%\\s*$") >= 0 || match(getline(line('.') - 1), ",\\s*$") >= 0 || match(getline(line('.') - 1), "(\\s*$") >= 0)
                        normal k$F)%
                endwhile
                " Highlights everything
                normal ^Vf(%
                while match(getline('.'), "+\\s*$") >= 0 || match(getline('.'), "%>%\\s*$") >= 0
                        normal $
                        call search('(', 'zW')
                        normal %
                endwhile
        endif
endfunction
