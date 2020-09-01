let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Code/xenontrade
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +135 src/modules/gui/gui.js
badd +213 src/modules/poe.js
badd +8 ~/.cache/typescript/3.9/node_modules/@types/python-shell/index.d.ts
badd +1 package.json
badd +683 node_modules/@types/node/base.d.ts
badd +25 src/main.js
argglobal
%argdel
set stal=2
edit src/modules/poe.js
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 86) / 173)
exe '2resize ' . ((&lines * 17 + 16) / 33)
exe 'vert 2resize ' . ((&columns * 141 + 86) / 173)
exe '3resize ' . ((&lines * 11 + 16) / 33)
exe 'vert 3resize ' . ((&columns * 141 + 86) / 173)
argglobal
enew
file NERD_tree_3
setlocal fdm=manual
setlocal fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'^\\s*$'&&getline(v:lnum+2)=~'\\S'?'<1':1
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
setlocal fdm=indent
setlocal fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'^\\s*$'&&getline(v:lnum+2)=~'\\S'?'<1':1
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9
setlocal fml=1
setlocal fdn=20
setlocal fen
13
normal! zo
let s:l = 213 - ((6 * winheight(0) + 8) / 17)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
213
normal! 089|
wincmd w
argglobal
if bufexists("src/modules/gui/gui.js") | buffer src/modules/gui/gui.js | else | edit src/modules/gui/gui.js | endif
setlocal fdm=indent
setlocal fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'^\\s*$'&&getline(v:lnum+2)=~'\\S'?'<1':1
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9
setlocal fml=1
setlocal fdn=20
setlocal fen
16
normal! zo
130
normal! zo
let s:l = 135 - ((5 * winheight(0) + 5) / 11)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
135
normal! 041|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 86) / 173)
exe '2resize ' . ((&lines * 17 + 16) / 33)
exe 'vert 2resize ' . ((&columns * 141 + 86) / 173)
exe '3resize ' . ((&lines * 11 + 16) / 33)
exe 'vert 3resize ' . ((&columns * 141 + 86) / 173)
tabedit src/main.js
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'^\\s*$'&&getline(v:lnum+2)=~'\\S'?'<1':1
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9
setlocal fml=1
setlocal fdn=20
setlocal fen
23
normal! zo
66
normal! zo
let s:l = 24 - ((21 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 043|
tabedit package.json
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'^\\s*$'&&getline(v:lnum+2)=~'\\S'?'<1':1
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9
setlocal fml=1
setlocal fdn=20
setlocal fen
2
normal! zo
79
normal! zo
let s:l = 92 - ((10 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
92
normal! 036|
tabnext 1
set stal=1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
