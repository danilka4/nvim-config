        inoremap <buffer><silent> ` ```{r}<CR>```<Esc>O
        inoremap <buffer><silent> `` `
        set iskeyword+=.
        map <Leader>r :new term://bash<CR>iR<CR><C-\><C-n>G<C-w>k
        map <Leader>q :wincmd j<CR>:q<CR>
nnoremap <leader>er :vsplit /etc/R/Renviron<CR>
nnoremap <Leader>ed :vsplit ~/.config/nvim/rmd.vim<CR>
nnoremap <leader>ej :vsplit ~/.config/nvim/UltiSnips/rmd.snippets<CR>
nnoremap <leader>ek :split ~/.vim/plugged/vim-snippets/UltiSnips/rmd.snippets<CR>
        " Creates a pipe
        inoremap <buffer><silent> ;s <SPACE>%>%
        " Creates an arrow
        inoremap <buffer><silent> ;a <SPACE><-<SPACE>
        " knits to default
        nmap <Leader>kk :call chansend(4, "rmarkdown::render('" . expand("%:p") . "')\n")<CR> 
        nmap K :call chansend(4, "?")<CR>viw<Plug>SendDownV:wincmd j<CR>i
        tnoremap q q<BS><C-\><C-n><C-w>k
        " edits rprofile
        nnoremap <leader>er :vsplit /etc/R/Renviron<cr>
        " and/or brackets
        nmap <Leader>l :call HighlightLine()<CR><Plug>SendDownV<CR>
        vmap <Leader>s SendDownV
        " Sends chunk
        nmap <Leader>c /```<CR>?```{r<CR>jV/```<CR>k<bar><Plug>SendDownV<bar>:nohlsearch<CR> 
        nmap <Leader>j /```{r<CR>j:nohlsearch<CR> " Go down a chunk
        nmap <Leader>k ?```{r<CR>nj:nohlsearch<CR> " Go up a chunk
        " Do current chunk and go down a chunk
        nmap <Leader>n ?```{r<CR>jV/```<CR>k<bar><Plug>SendDownV<bar>/```{r<CR>j:nohlsearch<CR> 
        nmap <Leader>u k/```$<CR>:nohlsearch<CR>:call FirstToTarget(line("."))<CR>
        nmap <Leader>a :call FirstToTarget(line("$"))<CR>
        vmap <Leader>v <Plug>SendDownV
        nmap <Leader>ip :call InstallPackage()<CR>
        nmap <Leader>ig :call InstallGit()<CR>
        nmap <Leader>si :call SaveImage()<CR>
