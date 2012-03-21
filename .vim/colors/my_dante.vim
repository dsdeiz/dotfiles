"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: "/home/caciano/.vim/dante.vim"
" Created: "Thu, 23 May 2002 00:12:20 -0300 (caciano)"
" Updated: "Sat, 24 Aug 2002 14:04:21 -0300 (caciano)"
" Copyright (C) 2002, Caciano Machado <caciano@inf.ufrgs.br>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme Option:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name = "dante"

" General colors
hi Normal	ctermfg=gray guifg=peachpuff3 guibg=black
hi Directory	term=NONE ctermfg=blue guifg=royalblue
hi ErrorMsg	term=standout ctermfg=white ctermbg=red guifg=white guibg=red3
hi NonText	term=NONE ctermfg=darkgray guibg=gray3 guifg=gray20
hi SpecialKey	term=NONE ctermfg=darkgray guifg=gray30
hi LineNr	term=underline ctermfg=darkgray guifg=ivory4 guibg=gray4
hi IncSearch	term=reverse cterm=reverse gui=reverse,NONE guifg=darkgoldenrod2
hi Search	term=reverse ctermfg=black ctermbg=yellow guifg=gray10 guibg=gold2
hi Visual	term=NONE,reverse cterm=NONE,reverse ctermfg=gray ctermbg=black gui=NONE,reverse guifg=gray40 guibg=black
hi VisualNOS	term=NONE,underline cterm=NONE,underline gui=NONE,underline
hi MoreMsg	term=NONE ctermfg=green gui=NONE guifg=olivedrab1
hi ModeMsg	term=NONE cterm=NONE gui=NONE
hi Question	term=standout ctermfg=green gui=NONE guifg=olivedrab1
hi WarningMsg	term=standout ctermfg=red gui=NONE guifg=red3
hi WildMenu	term=standout ctermfg=black ctermbg=yellow guifg=black guibg=gold2
hi Folded	term=standout ctermfg=blue ctermbg=white guifg=royalblue1 guibg=white
hi FoldColumn	term=standout ctermfg=blue ctermbg=white guifg=royalblue3 guibg=white
hi DiffAdd	term=NONE ctermbg=blue guibg=royalblue2
hi DiffChange	term=NONE ctermbg=darkmagenta guibg=maroon
hi DiffDelete	term=NONE cterm=NONE ctermfg=lightblue ctermbg=cyan gui=NONE guifg=lightblue guibg=cyan4
hi DiffText	term=reverse cterm=NONE ctermbg=red gui=NONE guibg=red3
hi Cursor	guifg=bg guibg=fg
hi lCursor	guifg=bg guibg=fg
hi StatusLine	term=reverse cterm=reverse gui=reverse guifg=gray60
hi StatusLineNC	term=reverse cterm=reverse gui=reverse guifg=gray40
hi VertSplit	term=reverse cterm=reverse gui=NONE,reverse guifg=gray40
hi Title	term=NONE ctermfg=magenta gui=NONE guifg=aquamarine

" syntax hi colors
hi Comment	term=NONE ctermfg=darkcyan guifg=cyan4
hi PreProc	term=underline ctermfg=darkblue guifg=dodgerblue4
hi Constant	term=underline ctermfg=darkred guifg=firebrick3
hi Type		term=underline ctermfg=darkgreen gui=none guifg=chartreuse3
hi Statement	term=NONE ctermfg=darkyellow gui=none guifg=gold3
hi Identifier	term=underline ctermfg=darkgreen guifg=darkolivegreen4
hi Ignore	term=NONE ctermfg=darkgray guifg=gray45
hi Special	term=underline ctermfg=brown guifg=sienna
hi Error	term=reverse ctermfg=gray ctermbg=red guifg=gray guibg=red3
hi Todo		term=standout ctermfg=black ctermbg=yellow gui=NONE guifg=gray10 guibg=yellow4
hi Underlined	term=underline cterm=underline ctermfg=darkblue gui=underline guifg=slateblue
hi Number	term=underline ctermfg=darkred guifg=red2
" syntax hi links
hi link String		Constant
hi link Character	Constant
hi link Number		Constant
hi link Boolean		Constant
hi link Float		Number
hi link Function	Identifier
hi link Number		Constant
hi link Conditional	Statement
hi link Repeat		Statement
hi link Label		Statement
hi link Keyword		Statement
hi link Exception	Statement
hi link Operator	Statement
hi link Include		PreProc
hi link Define		PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef		Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment	Special
hi link Debug		Special
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
