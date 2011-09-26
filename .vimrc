" Basic settings {{{

colorscheme distinguished
syntax on

filetype plugin on
filetype indent on

set backspace=indent,eol,start
set autochdir
set nocompatible

set vb t_vb=
set t_Co=256

set sessionoptions-=options
set matchpairs+=<:>
set mouse=a

set fileformats=unix,dos
set fileformat=unix

" }}}

" Layout settings {{{

set formatoptions=qrowcb

set laststatus=2
set list
set listchars=tab:>-,trail:-

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
set foldlevel=1
set foldcolumn=0

" }}}

" Keybind settings {{{

imap jj <esc>
imap <s-tab> <c-x><c-o>

" }}}

" Autocommand settings {{{

au FileType vim set foldmethod=marker

" Drupal *.module and *.install files.
augroup module
  autocmd BufRead,BufNewFile *.module set filetype=php.drupal
  autocmd BufRead,BufNewFile *.install set filetype=php.drupal
  autocmd BufRead,BufNewFile *.inc set filetype=php.drupal
  autocmd BufRead,BufNewFile *.theme set filetype=php.drupal
augroup END

" For python files.
autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4

" For haskell files.
autocmd FileType haskell set tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufRead,BufNewFile *.hs set tabstop=4 shiftwidth=4 softtabstop=4

" }}}

" Hilight settings {{{

hi Normal ctermbg=NONE
hi Folded cterm=NONE
hi NonText ctermbg=NONE
hi SpecialKey ctermfg=233

" }}}

" Plugin settings {{{

let g:php_folding=1

" }}}

" Drupal helpers {{{

inoremap \fn <C-R>=expand("%:t:r")<CR>

" }}}
