set background=dark
colo ir_black

let NERDTreeDirArrows=1

set guifont=Monaco\ 7.5
set guioptions=Aci

" hi Title gui=NONE
" hi CursorLine guibg=gray5
" hi NonText guibg=NONE guifg=black
" hi Normal guibg=black
" hi LineNr gui=NONE

" Hilight trailing whitespace
hi BadWhitespace guibg=red
match BadWhitespace /\s\+$/

" vim: foldmethod=marker
