" Basic settings {{{
set nocompatible
call pathogen#infect()

set t_Co=256

set background=dark
syntax on

filetype plugin indent on

set backspace=indent,eol,start

set vb t_vb=

set mouse=a

set fileformats=unix,dos
set fileformat=unix

set wildmenu
set wildmode=list:longest,full
set wildignore=*.png,*.jpg,*.jpeg,*.gif,*.swp,*.swo,sites/default/files/**,.git

set backupdir=~/.vim/backup
set directory=~/.vim/temp

set hidden

" }}}

" GUI vs Terminal version {{{

colo molokai
if has('gui_running')
  set guifont=Monaco\ 7.5
  let NERDTreeDirArrows=1
  let Powerline_symbols='fancy'
  set guioptions=Aci
  color twilight
else
  let Powerline_symbols='compatible'
endif

" }}}

" Layout settings {{{

set formatoptions=qrowcb

set laststatus=2
set list
set listchars=tab:»\ ,trail:·

set shiftwidth=2
set expandtab
set softtabstop=2
set tabstop=2

set ignorecase

set number
set nohlsearch
set incsearch
set showcmd
set ruler
set mousehide
set nocul
set completeopt-=preview
set textwidth=80

set so=5

" }}}

" Folding settings {{{

set foldenable
set foldmethod=syntax
set foldlevel=99
set foldcolumn=0

" }}}

" Keybind settings {{{

inoremap jj <esc>
cnoremap jj <esc>

nnoremap j gj
nnoremap k gk

map Y y$

let mapleader=","
let maplocalleader=","

" Load session
nmap <Leader>ls :so $HOME/.vim/session.vim<CR>

" }}}

" Autocommand settings {{{

autocmd FileType php let b:delimitMate_matchpairs="(:),[:],{:}""

autocmd VimLeave * NERDTreeClose
autocmd VimLeave * mks! ~/.vim/session.vim

" For haskell files.
autocmd FileType haskell set tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufRead,BufNewFile *.hs set tabstop=4 shiftwidth=4 softtabstop=4

" }}}

" Hilight settings {{{

" Hilight trailing whitespace
hi BadWhitespace guibg=red
match BadWhitespace /\s\+$/

hi Normal ctermbg=NONE
" hi CursorLine cterm=NONE
" hi Folded cterm=NONE
" Annoying tildes on NERDTree
hi NonText ctermbg=NONE ctermfg=0
" hi SpecialKey ctermfg=233
" hi CursorLine term=NONE cterm=NONE

" }}}

" Buffers {{{

" }}}

" Plugin settings {{{

let g:debuggerBreatAtEntry=0

" let NERDTreeDirArrows=1
let NERDTreeMouseMode=3
let NERDChristmasTree=1
" Allow 'traditional' way of file navigation
let NERDTreeHijackNetrw=0
" Set working directory when invoking NERDTree
let NERDTreeChDirMode=2
map <Leader>n :NERDTreeToggle<CR>
map <F10> :NERDTree<CR>
map <Leader>m :NERDTreeFromBookmark<space>
map <Leader>r :NERDTreeFind<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

nnoremap <Leader>t :TagbarToggle<CR>

nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>

" }}}

" Sessions {{{

set ssop-=options
set ssop-=buffers
set ssop-=help
set ssop-=blank

" }}}

" Drupal helpers {{{

inoremap <Leader>fn <C-R>=expand("%:t:r")<CR>

" }}}

" vim: foldmethod=marker
