" Vim color file

" Based on Wombat256mod version by
" - Danila Bespalov (danila.bespalov@gmail.com)
" Modified by
" - Mathias Brouilly (bymathias@gmail.com)

" Last change: 16-02-2013

" COLORS

" Black   234 #1c1c1c
" Red     203 #ff5f5f
" Green	  65  #5f875f
" Yellow  186 #d7d787
" Blue	  27  #005fff
" Magenta 90  #870087
" Cyan    238 #444444
" White	  252 #d0d0d0

" Black (bright)   232 #080808
" Red (bright)	   197 #ff005f
" Green (bright)   107 #87af5f
" Yellow (bright)  227 #ffff5f
" Blue (bright)	   75  #5fafff
" Magenta (bright) 99  #875fff
" Cyan (bright)    244 #808080
" White	(bright)   255 #eeeeee

set background=dark

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let colors_name = "kivabien"


" General colors
hi Normal    ctermfg=252 ctermbg=234 cterm=none
hi Cursor	 ctermfg=234 ctermbg=227 cterm=none
hi Visual    ctermfg=252 ctermbg=238 cterm=none
hi VisualNOS ctermfg=252 ctermbg=238 cterm=none
hi Search    ctermfg=232 ctermbg=227 cterm=none
hi Folded    ctermfg=252 ctermbg=235 cterm=none
hi Title     ctermfg=203 ctermbg=234 cterm=none

hi! link FoldColumn	Folded

" StatusLine
hi StatusLine	ctermfg=white ctermbg=27 cterm=none
hi StatusLineNC	ctermfg=238 ctermbg=232 cterm=none
hi VertSplit	ctermfg=235 ctermbg=235 cterm=none
hi LineNr		ctermfg=238 ctermbg=232 cterm=none
hi NonText		ctermfg=234 ctermbg=234 cterm=none
hi SpecialKey	ctermfg=197 ctermbg=234 cterm=none
hi WarningMsg	ctermfg=203 ctermbg=none cterm=none
hi ErrorMsg		ctermfg=255 ctermbg=197 cterm=bold

" Vim >= 7.0 specific colors
if version >= 700

    "change statusline color to show insert or normal mode
    hi User1 ctermfg=234 ctermbg=white
    au InsertEnter * hi StatusLine ctermfg=234 ctermbg=white cterm=none term=reverse
    au InsertEnter * hi User1 ctermfg=white ctermbg=27
    au InsertLeave * hi StatusLine ctermfg=white ctermbg=27 cterm=none term=reverse
    au InsertLeave * hi User1 ctermfg=234 ctermbg=white

    hi CursorLine ctermfg=none ctermbg=235 cterm=none
    hi MatchParen ctermfg=255 ctermbg=197 cterm=bold
    hi Pmenu	  ctermfg=244 ctermbg=238 cterm=none
    hi PmenuSel	  ctermfg=255	ctermbg=203	cterm=none
    hi! link CursorColumn CursorLine

endif

" Diff highlighting
hi DiffAdd    ctermfg=107 ctermbg=none cterm=none
hi DiffDelete ctermfg=203 ctermbg=none cterm=none
hi DiffText	  ctermfg=75 ctermbg=none cterm=none
hi DiffChange ctermfg=227 ctermbg=none cterm=none

"hi CursorIM
hi Directory ctermfg=107 ctermbg=none cterm=none
"hi IncSearch
"hi Menu
"hi ModeMsg
"hi MoreMsg
"hi PmenuSbar
"hi PmenuThumb
"hi Question
"hi Scrollbar
hi SignColumn ctermfg=238 ctermbg=232 cterm=none
hi SpellBad ctermfg=255 ctermbg=197
hi SpellCap ctermfg=255 ctermbg=197
"hi SpellLocal
"hi SpellRare
hi TabLine ctermfg=White ctermbg=DarkBlue cterm=none
hi TabLineFill ctermfg=232 ctermbg=238 cterm=none
"hi TabLineSel
"hi Tooltip
"hi User1
"hi User9
"hi WildMenu

" Syntax highlighting
hi Keyword    ctermfg=27 cterm=none
hi Statement  ctermfg=99 cterm=none
hi Constant	  ctermfg=203 cterm=none
hi Number     ctermfg=203 cterm=none
hi PreProc	  ctermfg=197 cterm=none
hi Function	  ctermfg=227 cterm=none
hi Identifier ctermfg=186 cterm=none
hi Type	      ctermfg=107 cterm=none
hi Special    ctermfg=227 cterm=none
hi String     ctermfg=75 cterm=none
hi Comment    ctermfg=244 cterm=none
hi Todo	      ctermfg=232 ctermbg=227 cterm=bold

" Do not underline html link
hi link htmlLink none

" vim:set ts=4 sw=4 noet:
