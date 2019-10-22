let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Code/xenontrade
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 src/modules/parser.js
badd +59 src/modules/whisper.js
badd +398 src/modules/gui/gui.js
badd +1 src/modules/gui/icons.js
badd +1 src/modules/gui/settings.js
badd +1 src/lib/moment.min.js
badd +12 src/main.js
badd +36 src/modules/entries/whisper-entry.js
badd +124 src/index.js
badd +1 node_modules/poe-log-monitor/resource/events.json
argglobal
silent! argdel *
edit node_modules/poe-log-monitor/resource/events.json
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
13
normal! zo
15
normal! zo
21
normal! zo
23
normal! zo
33
normal! zo
35
normal! zo
let s:l = 39 - ((38 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
39
normal! 08|
lcd ~/Code/xenontrade
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
