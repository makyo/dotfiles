" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:   Ron Aaron <ron@ronware.org>
" Last Change:  2003 May 02

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "skunklord"
hi Normal               guifg=cyan                      guibg=black
hi Comment      term=bold               ctermfg=DarkCyan                guifg=#80a0ff
hi Constant     term=underline  ctermfg=Magenta         guifg=Magenta
hi Special      term=bold               ctermfg=DarkMagenta     guifg=Red
hi Identifier term=underline    cterm=bold                      ctermfg=Cyan guifg=#40ffff
hi Statement term=bold          ctermfg=Yellow gui=bold guifg=#aa4444
hi PreProc      term=underline  ctermfg=LightBlue       guifg=#ff80ff
hi Type term=underline          ctermfg=LightGreen      guifg=#60ff60 gui=bold
hi Function     term=bold               ctermfg=White guifg=White
hi Repeat       term=underline  ctermfg=White           guifg=white
hi Operator                             ctermfg=Red                     guifg=Red
hi Ignore                               ctermfg=black           guifg=bg
hi Error        term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
hi Todo term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String  Constant
hi link Character       Constant
hi link Number  Constant
hi link Boolean Constant
hi link Float           Number
hi link Conditional     Repeat
hi link Label           Statement
hi link Keyword Statement
hi link Exception       Statement
hi link Include PreProc
hi link Define  PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment Special
hi link Debug           Special

" Maddy changes
" Git
hi  SignColumn ctermbg=None

" Minimalist tabline and splits
" Consider adding the following:
"   set fillchars+=vert:│
hi  clear TabLineFill
hi  clear TabLine
hi  clear TabLineSel
hi  TabLineFill cterm=underline ctermfg=239
hi  TabLine cterm=underline ctermfg=242
hi  TabLineSel  cterm=underline ctermfg=241 ctermbg=235
hi  clear VertSplit
hi  VertSplit ctermfg=239

" Chill out some of the brighter colors
hi  Comment term=bold ctermfg=DarkCyan
hi  String  term=underline  ctermfg=103
hi  Operator  ctermfg=204
hi  Statement term=bold ctermfg=LightGreen
hi  Conditional term=bold ctermfg=LightGreen
hi  Repeat  term=bold ctermfg=LightGreen
hi  Todo  term=standout ctermbg=54  ctermfg=LightCyan
hi  clear SpellBad
hi  SpellBad  cterm=underline ctermfg=161
hi  markdownItalic  cterm=italic ctermfg=Magenta
hi  LineNr ctermfg=239
hi  NonText ctermfg=239
hi  Search cterm=italic ctermfg=232 ctermbg=60
