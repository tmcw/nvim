" Maintainer:	Tom MacWright (macwright@gmail.com)
" Maintainer:	Lars H. Nielsen (dengmao@gmail.com)
" Last Change:	January 22 2007

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "kod"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#2d2d2d
  hi CursorColumn guibg=#2d2d2d
  hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold
  hi Pmenu 		guifg=#f6f3e8 guibg=#444444
  hi PmenuSel 	guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor 		guifg=NONE    guibg=#656565 gui=none
hi CursorLine	guibg=#212628
hi Normal 		guifg=#eeeeee guibg=#222222 gui=none
hi NonText 		guifg=#808080 guibg=#303030 gui=none
hi LineNr 		guifg=#474038 guibg=#000000 gui=none
hi StatusLine 	guifg=#f6f3e8 guibg=#000000 gui=italic
hi StatusLineNC guifg=#857b6f guibg=#000000 gui=none
hi VertSplit 	guifg=#444444 guibg=#444444 gui=none
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold
hi Visual		guifg=#f6f3e8 guibg=#444444 gui=none
hi SpecialKey	guifg=#808080 guibg=#343434 gui=none

" Syntax highlighting
hi Comment 		guifg=#666666 gui=italic
hi Todo 		guifg=#8f8f8f gui=italic
hi Constant 	guifg=#FF8431 gui=none
hi String 		guifg=#9aca7e guibg=#212A24 gui=italic
hi Identifier 	guifg=#cae682 gui=none
hi Type 		guifg=lightsalmon gui=none
hi Statement 	guifg=#8ac6f2 gui=none
hi Repeat       guifg=#5BB4F3 gui=none
hi PreProc 		guifg=#FF604E gui=none
hi MatchParen   guibg=#FFA500 guifg=#1F1F1F	gui=none
hi Number		guifg=#C969B6 gui=none

hi Underlined   guibg=#1F1F1F guifg=#FC4234	gui=underline
hi Ignore 	    guibg=#1F1F1F guifg=#1F1F1F	gui=none

hi Keyword 		guifg=#66c8ef gui=none
hi Function		guifg=#66c8ef gui=none
hi Special		guifg=#66c8ef gui=none

hi javaScriptFuncName 	guifg=#85FFDF  guibg=#1F2B31 gui=none

hi link jsParen      Normal
hi javaScriptSpecial guifg=#D6F8B8 gui=none
hi WarningMsg	guifg=#FF5555
hi Exception    guifg=#EC6B6B gui=none
hi Operator     guifg=#FFCBAF gui=none
hi Delimiter    guifg=#FFA97A guibg=#000000 gui=none
hi Conditional      guifg=#2A7DD1     guibg=NONE

" TODO:  - Add colors to the cterm
hi javaScriptBrowserObjects       guifg=#DBB6D2 ctermfg=182   gui=italic
hi javaScriptDOMObjects           guifg=#DBB6D2 gui=italic
hi javaScriptDOMMethods           guifg=#D4FA9B ctermfg=192
hi link javaScriptDOMProperties   Keyword
hi javaScriptAjaxObjects          guifg=#5d91d3 gui=underline
hi javaScriptAjaxMethods          guifg=#6699CC ctermfg=68
hi javaScriptAjaxProperties       guifg=#FF9494 ctermfg=210
hi javaScriptHtmlElemProperties   guifg=#FF9494 ctermfg=210
hi javaScriptEventListenerKeyword guifg=#6699CC ctermfg=68
hi javaScriptFutureKeys guifg=#66c8ef
hi! link javaScriptValue	Constant
hi! link javaScriptNull	Constant
hi! link javaScriptBraces	NonText

" Special additions created by mktypes.py are shades of Purple or Grey
hi Class            guifg=#42DCFF
hi DefinedName      guifg=#42DCFF
hi EnumerationValue guifg=#42DCFF
hi EnumerationName  guifg=#42DCFF
hi Member           guifg=#42DCFF
hi Union            guifg=#42DCFF
hi GlobalVariable   guifg=#42DCFF
hi LocalVariable    guifg=#42DCFF
hi GlobalConstant   guifg=#42DCFF

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Label           Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

" Special for HTML
hi link htmlTag         Keyword
hi link htmlTagName     Conditional
hi link htmlEndTag      Identifier

" Special for XML
hi link xmlTag          Keyword
hi link xmlTagName      Conditional
hi link xmlEndTag       Identifier

" Doxygen
hi doxygenBrief                 gui=NONE guifg=#fdab60   guibg=NONE
hi doxygenParam                 gui=NONE guifg=#fdd090   guibg=NONE
hi doxygenPrev                  gui=NONE guifg=#fdd090   guibg=NONE
hi doxygenSmallSpecial          gui=NONE guifg=#fdd090   guibg=NONE
hi doxygenSpecial               gui=NONE guifg=#fdd090   guibg=NONE
hi doxygenComment               gui=NONE guifg=#ad7b20   guibg=NONE
hi doxygenSpecial               gui=NONE guifg=#fdab60   guibg=NONE
hi doxygenSpecialMultilineDesc  gui=NONE guifg=#ad600b   guibg=NONE
hi doxygenSpecialOnelineDesc    gui=NONE guifg=#ad600b   guibg=NONE

" Custom
hi Todo         gui=bold guifg=#FFDA53 guibg=#1F1F1F

" HTML-specific formatting
hi htmlBold									ctermbg=234  ctermfg=252	 cterm=bold
hi htmlBoldItalic 					ctermbg=234	 ctermfg=252	 cterm=bold,italic
hi htmlBoldUnderline 				ctermbg=234	 ctermfg=252	 cterm=bold,underline
hi htmlBoldUnderlineItalic 	ctermbg=234	 ctermfg=252	 cterm=bold,underline,italic
hi htmlItalic 							ctermbg=234	 ctermfg=252	 cterm=italic
hi htmlUnderline 						ctermbg=234	 ctermfg=252	 cterm=underline
hi htmlUnderlineItalic 			ctermbg=234	 ctermfg=252	 cterm=underline,italic
