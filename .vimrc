" Basic settings {{{
set nocompatible
call pathogen#infect()

set t_Co=256
colorscheme xoria256
syntax on

filetype on
filetype plugin on
filetype indent on

set backspace=indent,eol,start
set autochdir

set vb t_vb=

" set sessionoptions-=options
set mouse=a

set fileformats=unix,dos
set fileformat=unix

" }}}

" Layout settings {{{

set formatoptions=qrowcb

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
set laststatus=2
set list
set listchars=tab:»\ ,trail:·

set shiftwidth=2
set expandtab
set softtabstop=2
set tabstop=2

set ignorecase
set autoindent

set number
set nohlsearch
set incsearch
set showcmd
set ruler
set mousehide
set nocul
set completeopt-=preview

" }}}

" Folding settings {{{

set foldenable
set foldmethod=syntax
set foldlevel=2
set foldcolumn=0

" }}}

" Keybind settings {{{

imap jj <esc>
imap <s-tab> <c-x><c-o>

nnoremap j gj
nnoremap k gk

let mapleader=","

" }}}

" Autocommand settings {{{

au FileType vim set foldmethod=marker

autocmd BufRead,BufNewFile *.tpl.php set filetype=php.xhtml
autocmd BufRead,BufNewFile *.module set filetype=php
autocmd BufRead,BufNewFile *.install set filetype=php
autocmd BufRead,BufNewFile *.inc set filetype=php
autocmd BufRead,BufNewFile *.profile set filetype=php
autocmd BufRead,BufNewFile *.theme set filetype=php
autocmd BufRead,BufNewFile *.engine set filetype=php
autocmd BufRead,BufNewFile *.test set filetype=php

" For python files.
autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4

" For haskell files.
autocmd FileType haskell set tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufRead,BufNewFile *.hs set tabstop=4 shiftwidth=4 softtabstop=4

" }}}

" Hilight settings {{{

" hi Normal ctermbg=NONE
" hi CursorLine cterm=NONE
" hi Folded cterm=NONE
" Annoying tildes on NERDTree
hi NonText ctermbg=NONE ctermfg=0
" hi SpecialKey ctermfg=233

" }}}

" Buffers {{{

nnoremap <F5> :buffers<CR>:buffer<Space>

" }}}

" Plugin settings {{{

let syntastic_enable_signs=1
let syntastic_auto_jump=1
let syntastic_auto_loc_list=2

let NERDTreeDirArrows=1
let NERDTreeMouseMode=3
let NERDChristmasTree=1
map <Leader>n :NERDTreeToggle<CR>
map <F10> :NERDTree<CR>
map <Leader>r :NERDTreeFind<CR>

let ackprg="ack-grep -H --nocolor --nogroup --column"

nnoremap <silent> <F9> :TagbarToggle<CR>

let UltiSnipsExpandTrigger="<c-\\>"

let Powerline_symbols='fancy'

let delimitMate_matchpairs="(:),[:],{:}"

let php_folding=2

" }}}

" Sessions {{{

nmap SQ <ESC>:mksession! ~/.vim/Session.vim<CR>:wqa<CR>
" autocmd VimEnter * so ~/.vim/Session.vim

" }}}

" Drupal helpers {{{

inoremap <Leader>fn <C-R>=expand("%:t:r")<CR>

" }}}

fu! Create_post(str)
  exec ':e ' . strftime('%F') . '-' . a:str . '.md'
endfu

command! -nargs=1 CreatePost call Create_post(<f-args>)
