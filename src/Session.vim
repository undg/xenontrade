let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Code/xenontrade/src
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +34 main.js
badd +49 modules/whisper.js
badd +103 modules/entries/whisper-entry.js
badd +54 modules/parser.js
badd +297 modules/entry.js
badd +35 resource/templates/whisper.html
badd +2 css/attr-classes.css
badd +90 modules/gui/gui.js
badd +0 resource/defaultConfig.json
argglobal
silent! argdel *
set stal=2
edit modules/whisper.js
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 33 + 23) / 47)
exe '2resize ' . ((&lines * 10 + 23) / 47)
argglobal
setlocal fdm=indent
setlocal fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'^\\s*$'&&getline(v:lnum+2)=~'\\S'?'<1':1
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9
setlocal fml=1
setlocal fdn=20
setlocal fen
4
normal! zo
16
normal! zo
50
normal! zo
let s:l = 49 - ((16 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
49
normal! 03|
lcd ~/Code/xenontrade/src
wincmd w
argglobal
enew
setlocal fdm=manual
setlocal fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'^\\s*$'&&getline(v:lnum+2)=~'\\S'?'<1':1
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9
setlocal fml=1
setlocal fdn=20
setlocal fen
lcd ~/Code/xenontrade/src
wincmd w
exe '1resize ' . ((&lines * 33 + 23) / 47)
exe '2resize ' . ((&lines * 10 + 23) / 47)
tabedit ~/Code/xenontrade/src/resource/templates/whisper.html
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 33 + 23) / 47)
exe '2resize ' . ((&lines * 10 + 23) / 47)
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
3
normal! zo
13
normal! zo
35
normal! zo
36
normal! zo
let s:l = 36 - ((21 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
36
normal! 080|
lcd ~/Code/xenontrade/src
wincmd w
argglobal
enew
setlocal fdm=manual
setlocal fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'^\\s*$'&&getline(v:lnum+2)=~'\\S'?'<1':1
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9
setlocal fml=1
setlocal fdn=20
setlocal fen
lcd ~/Code/xenontrade/src
wincmd w
exe '1resize ' . ((&lines * 33 + 23) / 47)
exe '2resize ' . ((&lines * 10 + 23) / 47)
tabedit ~/Code/xenontrade/src/resource/defaultConfig.json
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
3
normal! zo
11
normal! zo
14
normal! zo
let s:l = 30 - ((11 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
30
normal! 024|
lcd ~/Code/xenontrade/src
tabedit ~/Code/xenontrade/src/modules/entries/whisper-entry.js
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
6
normal! zo
110
normal! zo
117
normal! zo
122
normal! zo
146
normal! zo
167
normal! zo
171
normal! zo
let s:l = 118 - ((5 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
118
normal! 011|
lcd ~/Code/xenontrade/src
tabnext 4
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
