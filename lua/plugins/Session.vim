let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim/lua/plugins
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +31 rss.lua
badd +1 ~/.config/nvim/lua/lazy-nvim.lua
badd +25 ~/.local/share/nvim/lazy/feed.nvim/lua/feed.lua
badd +18 ~/.local/share/nvim/lazy/feed.nvim/lazy.lua
badd +22 ~/.local/share/nvim/lazy/feed.nvim/minimal.lua
badd +68 ~/.local/share/nvim/lazy/feed.nvim/lua/feed/commands.lua
badd +172 ~/.local/share/nvim/lazy/feed.nvim/lua/feed/config.lua
badd +3 ~/.config/nvim/ftplugin/tex.lua
badd +180 ~/.config/nvim/ftplugin/markdown.lua
badd +1 ~/.config/nvim/ftplugin/nix.lua
badd +18 ~/.config/nvim/ftplugin/r.lua
badd +1 ~/.config/nvim/ftplugin/rmd.lua
badd +4 ~/.config/nvim/init.lua
badd +4 ~/.config/nvim/lua/snippets/markdown.lua
badd +91 ~/.config/nvim/lua/keybinds.lua
badd +350 ~/.local/share/nvim/lazy/feed.nvim/doc/feed.txt
badd +5 ~/.local/share/nvim/lazy/feed.nvim/lua/feed/ui.lua
badd +292 ~/.local/share/nvim/lazy/feed.nvim/lua/feed/ui/window.lua
badd +28 ~/.local/share/nvim/lazy/feed.nvim/lua/feed/ui/stream.lua
argglobal
%argdel
$argadd rss.lua
edit ~/.config/nvim/ftplugin/markdown.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 20 + 22) / 44)
exe 'vert 1resize ' . ((&columns * 66 + 66) / 132)
exe '2resize ' . ((&lines * 20 + 22) / 44)
exe 'vert 2resize ' . ((&columns * 65 + 66) / 132)
exe '3resize ' . ((&lines * 21 + 22) / 44)
exe 'vert 3resize ' . ((&columns * 65 + 66) / 132)
exe '4resize ' . ((&lines * 21 + 22) / 44)
exe 'vert 4resize ' . ((&columns * 66 + 66) / 132)
argglobal
balt ~/.config/nvim/ftplugin/tex.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 180 - ((16 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 180
normal! 019|
wincmd w
argglobal
if bufexists(fnamemodify("rss.lua", ":p")) | buffer rss.lua | else | edit rss.lua | endif
if &buftype ==# 'terminal'
  silent file rss.lua
endif
balt ~/.config/nvim/lua/keybinds.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 30 - ((17 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 30
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/.local/share/nvim/lazy/feed.nvim/lua/feed/ui/window.lua", ":p")) | buffer ~/.local/share/nvim/lazy/feed.nvim/lua/feed/ui/window.lua | else | edit ~/.local/share/nvim/lazy/feed.nvim/lua/feed/ui/window.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.local/share/nvim/lazy/feed.nvim/lua/feed/ui/window.lua
endif
balt ~/.local/share/nvim/lazy/feed.nvim/lua/feed/ui/stream.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 115 - ((9 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 115
normal! 07|
wincmd w
argglobal
if bufexists(fnamemodify("~/.local/share/nvim/lazy/feed.nvim/lua/feed/config.lua", ":p")) | buffer ~/.local/share/nvim/lazy/feed.nvim/lua/feed/config.lua | else | edit ~/.local/share/nvim/lazy/feed.nvim/lua/feed/config.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.local/share/nvim/lazy/feed.nvim/lua/feed/config.lua
endif
balt ~/.local/share/nvim/lazy/feed.nvim/lua/feed/ui.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 172 - ((9 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 172
normal! 04|
wincmd w
exe '1resize ' . ((&lines * 20 + 22) / 44)
exe 'vert 1resize ' . ((&columns * 66 + 66) / 132)
exe '2resize ' . ((&lines * 20 + 22) / 44)
exe 'vert 2resize ' . ((&columns * 65 + 66) / 132)
exe '3resize ' . ((&lines * 21 + 22) / 44)
exe 'vert 3resize ' . ((&columns * 65 + 66) / 132)
exe '4resize ' . ((&lines * 21 + 22) / 44)
exe 'vert 4resize ' . ((&columns * 66 + 66) / 132)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
