" Vim color file
" Author: Jarod Luebbert <jarodluebbert@gmail.com>
"
" Note: Based on the Cobalt theme for TextMate
"
set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "cobalt"


if v:version > 700
  hi CursorLine     guibg=#001d36
  hi CursorColumn   guibg=#1E0200
  hi MatchParen     guifg=#FFFA7F guibg=#1E0200 gui=bold
  hi Pmenu          guifg=#FFFFFF guibg=#323232
  hi PmenuSel       guifg=#FFFFFF guibg=#DD0521
endif

" Background and menu colors
hi Cursor           guifg=NONE guibg=#FFFFFF gui=none
hi Normal           guifg=#ffffff guibg=#012341 gui=none
hi NonText          guifg=#FFFFFF guibg=#123b5f gui=none
hi LineNr           guifg=#888888 guibg=#e3e3e3 gui=none
hi StatusLine       guifg=#FFFFFF guibg=#123b5f gui=italic
hi StatusLineNC     guifg=#FFFFFF guibg=#462A28 gui=none
hi VertSplit        guifg=#FFFFFF guibg=#012341 gui=none
hi Folded           guifg=#FFFFFF guibg=#1E0200 gui=none
hi Title            guifg=#DD0521 guibg=NONE	gui=bold
hi Visual           guifg=#FFFA7F guibg=#123b5f gui=none
hi SpecialKey       guifg=#D82C32 guibg=#2D110F gui=none

" Syntax highlighting
hi Comment guifg=#0088eb gui=italic
hi Constant guifg=#ff628c gui=none
hi Number guifg=#ff628c gui=none
hi Identifier guifg=#f7c565 gui=none
hi Statement guifg=#ff9d00 gui=none
hi Function guifg=#ffe372 gui=none
hi Special guifg=#6334A4 gui=none
hi PreProc guifg=#6334A4 gui=none
hi Keyword guifg=#ff9b2a gui=none
hi String guifg=#3ad900 gui=none
hi Type guifg=#f7ee80 gui=none
hi pythonBuiltin guifg=#FF8481 gui=none
