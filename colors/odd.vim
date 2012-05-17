" Maintainer:	Tom MacWright (tom@macwright.org)

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "odd"

" Vim >= 7.0 specific colors
if version >= 700
  " hi CursorLine guibg=#2d2d2d
  hi CursorColumn guibg=#2d2d2d
  hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold
  hi Pmenu 		guifg=#f6f3e8 guibg=#444444
  hi PmenuSel 	guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor 		guifg=NONE    guibg=#444444 gui=none
hi CursorLine	guibg=#101010
hi Normal 		guifg=#eeeeee guibg=#1a1a1a gui=none
hi link NonText Normal
hi LineNr 		guifg=#333333 guibg=#131313 gui=none
hi StatusLine 	guifg=#f6f3e8 guibg=#434343 gui=italic
hi StatusLineNC guifg=#857b6f guibg=#000000 gui=none
hi VertSplit 	guifg=#444444 guibg=#444444 gui=none
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold
hi Visual		guifg=#f6f3e8 guibg=#444444 gui=none
hi SpecialKey	guifg=#808080 guibg=#343434 gui=none

" Syntax highlighting
hi Comment 		guifg=#666666 gui=italic
hi Todo 		guifg=#8f8f8f gui=italic
hi Constant 	guifg=#ffc6e3 gui=none

hi Repeat       guifg=#5BB4F3 gui=none
hi PreProc 		guifg=#efcc92 gui=none
hi MatchParen   guibg=#FFA500 guifg=#1F1F1F	gui=none
" hi Number		guifg=#C969B6 gui=none

hi Underlined   guibg=#1F1F1F guifg=#FC4234	gui=underline
hi Ignore 	    guibg=#1F1F1F guifg=#1F1F1F	gui=none

hi Function		guifg=#F0677E gui=none

hi link String Constant
hi link Identifier Constant
hi link Type Constant
hi link Statement Constant

hi link Special Function
hi link Keyword Function

hi link javaScriptFuncName Identifier

hi link javaScriptSpecial Keyword
hi WarningMsg	guifg=#FF5555
hi Exception    guifg=#EC6B6B gui=none
hi link Operator Function
hi link Delimiter Function
hi link Conditional Function

" Javascript
hi link javaScriptBrowserObjects Constant
hi link javaScriptDOMObjects Constant
hi link javaScriptDOMMethods Constant
hi link javaScriptDOMProperties Keyword
hi link javaScriptAjaxObjects Constant
hi link javaScriptAjaxMethods Constant
hi link javaScriptAjaxProperties Constant
hi link javaScriptHtmlElemProperties Constant
hi link javaScriptEventListenerKeyword Constant
hi link javaScriptFutureKeys Constant

" mktypes
hi link Class       Constant
hi link DefinedName       Constant
hi link Member       Constant
hi link Union       Constant
hi link GlobalVariable       Constant
hi link LocalVariable       Constant
hi link GlobalConstant       Constant
hi link EnumerationValue       Constant
hi link EnumerationName       Constant

hi link Character       Constant
hi link Boolean         Constant
" hi link Float           Number
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
hi link doxygenBrief Conditional
hi link doxygenParam Constant
hi doxygenPrev                  gui=NONE guifg=#fdd090   guibg=NONE
hi link doxygenSmallSpecial Keyword
hi link doxygenSpecial Keyword
hi link doxygenComment Comment
hi link doxygenSpecialMultilineDesc String
hi link doxygenSpecialOnelineDesc String

" HTML-specific formatting
hi htmlBold									ctermbg=234  ctermfg=252	 cterm=bold
hi htmlBoldItalic 					ctermbg=234	 ctermfg=252	 cterm=bold,italic
hi htmlBoldUnderline 				ctermbg=234	 ctermfg=252	 cterm=bold,underline
hi htmlBoldUnderlineItalic 	ctermbg=234	 ctermfg=252	 cterm=bold,underline,italic
hi htmlItalic 							ctermbg=234	 ctermfg=252	 cterm=italic
hi htmlUnderline 						ctermbg=234	 ctermfg=252	 cterm=underline
hi htmlUnderlineItalic 			ctermbg=234	 ctermfg=252	 cterm=underline,italic
