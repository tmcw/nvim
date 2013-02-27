" Vim color scheme
"
" Author: tristen <@fallsemo>

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='superman'

hi Normal         guifg=#93A1A1 ctermfg=247  guibg=#121212 ctermbg=233  gui=NONE cterm=NONE
hi Cursor         guifg=#121212 ctermfg=233  guibg=#F8F8F0 ctermbg=255  gui=NONE cterm=NONE

" Light Blue
hi Boolean        guifg=#4BC7f4 ctermfg=159  gui=NONE cterm=NONE
hi Constant       guifg=#4BC7f4 ctermfg=159  gui=bold cterm=bold
hi PreProc        guifg=#4BC7f4 ctermfg=159  gui=bold cterm=bold

" Light yellow
hi Character      guifg=#C1DA86 ctermfg=229  gui=NONE cterm=NONE

" Darker Yellow
hi Identifier     guifg=#9DA81D ctermfg=142  gui=NONE cterm=NONE
hi StorageClass   guifg=#9DA81D ctermfg=142  gui=italic cterm=NONE

hi Debug          guifg=#BCA3A3 ctermfg=248  gui=bold cterm=bold
hi Delimter       guifg=#8F8F8F ctermfg=245  gui=NONE cterm=NONE
hi DiffAdd                                   guibg=#13354A ctermbg=236  gui=NONE cterm=NONE
hi DiffChange     guifg=#89807D ctermfg=244  guibg=#4C4745 ctermbg=238  gui=NONE cterm=NONE
hi DiffText                                  guibg=#4C4745 ctermbg=238  gui=italic cterm=NONE

" Lighter brick
hi Error          guifg=#FF9E80 ctermfg=210  guibg=#080808 ctermbg=232  gui=NONE cterm=NONE
hi Conditional    guifg=#FF9E80 ctermfg=210

" Darker brick
hi ErrorMsg       guifg=#EE6E47 ctermfg=203  guibg=#232526 ctermbg=235  gui=bold cterm=bold
hi Statement      guifg=#EE6E47 ctermfg=203
hi Tag            guifg=#EE6E47 ctermfg=203  gui=italic cterm=NONE

" Turtle Green
hi Function       guifg=#93C05E ctermfg=148  gui=bold cterm=bold
hi Directory      guifg=#93C05E ctermfg=148  gui=NONE cterm=NONE
hi SignColumn     guifg=#93C05E ctermfg=148  guibg=#232526 ctermbg=235  gui=NONE cterm=NONE

" Greyblue
hi Comment        guifg=#5F6C6F ctermfg=241
hi SpecialComment guifg=#5F6C6F ctermfg=241  gui=bold cterm=bold

hi Ignore         guifg=#121212 ctermfg=233  gui=NONE cterm=NONE
hi Macro          guifg=#C4BE89 ctermfg=180  gui=italic cterm=NONE

" Blue
hi Define         guifg=#338EB3 ctermfg=33   gui=NONE cterm=NONE
hi Type           guifg=#338EB3 ctermfg=33   gui=NONE cterm=NONE
hi WildMenu       guifg=#338EB3 ctermfg=33   guibg=#000000 ctermbg=16   gui=NONE cterm=NONE
hi Special        guifg=#338EB3 ctermfg=33   gui=italic cterm=NONE

hi MatchParen     guifg=#000000 ctermfg=16   guibg=#FD971F ctermbg=208  gui=bold cterm=bold
hi ModeMsg        guifg=#E6DB74 ctermfg=186  gui=NONE cterm=NONE
hi PmenuSel                                  guibg=#808080 ctermbg=244  gui=NONE cterm=NONE
hi Search         guifg=#FFFFFF ctermfg=231  guibg=#455354 ctermbg=239  gui=NONE cterm=NONE
hi Underlined     guifg=#808080 ctermfg=244  gui=underline cterm=underline
hi Title          guifg=#EEEEEE ctermfg=255  gui=NONE cterm=NONE
hi Todo           guifg=#FFFFFF ctermfg=15   guibg=NONE ctermbg=NONE    gui=underline cterm=underline
hi WarningMsg     guifg=#FFFFFF ctermfg=231  guibg=#262626 ctermbg=235  gui=bold cterm=bold

" == Editor Aesthetics ====================================

hi VertSplit      guifg=#1C1C1C ctermfg=234  guibg=#1C1C1C ctermbg=234
hi StatusLine     guifg=#808080 ctermfg=244  guibg=#1C1C1C ctermbg=234 gui=NONE cterm=NONE
hi StatusLineNC   guifg=#455354 ctermfg=239  guibg=#1C1C1C ctermbg=234 gui=NONE cterm=NONE
hi Visual         guifg=#465457 ctermfg=240  guibg=#1C1C1C ctermbg=234 gui=NONE cterm=NONE
hi LineNr         guifg=#303030 ctermfg=236  gui=NONE cterm=NONE
hi NonText        guifg=#303030 ctermfg=236  " The tilde when vim starts
hi Folded         guifg=#FFFFFF ctermfg=255  guibg=#005FAF ctermbg=25 " Code folding
hi FoldColumn     guifg=#FFFFFF ctermfg=255  guibg=#005FAF ctermbg=25
hi CursorLine     guibg=#1C1C1C ctermbg=234  cterm=NONE
hi MoreMsg        guifg=#FF9E80 ctermfg=173
hi Question       guifg=#8ae234 gui=none

" Pmenu
hi Pmenu          guifg=#93a1a1 ctermfg=247  guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
hi PmenuSel       guifg=#121212 ctermfg=233  guibg=#FFFFFF ctermbg=255 gui=NONE cterm=NONE
hi PmenuSbar                                 guibg=#455354 ctermbg=239
hi PmenuThumb     guifg=#93a1a1 ctermfg=247

" NerdTree
hi link NerdTreeDirSlash  function

" == Sharing! =============================================

hi link Number        Boolean
hi link Float         Boolean
hi link Set           Boolean
hi link Option        Boolean
hi link String        Character
hi link Label         Character
hi link Keyword       Conditional
hi link Repeat        Conditional
hi link Operator      Conditional
hi link CursorColumn  CursorLine
hi link Exception     Directory
hi link PreCondit     Directory
hi link DiffDelete    Error
hi link SpecialChar   Statement
hi link VertSplit     LineNr
hi link Folded        FoldColumn
hi link IncSearch     Macro
hi link Typedef       Type
hi link Structure     Type
hi link Pmenu         WildMenu
hi link Question      Special
hi link SpecialKey    Special
hi link MoreMsg       ModeMsg
hi link PmenuSbar     PmenuSel
hi link VisualNOS     Visual
hi link SharpBang     Normal
hi link Include       Tag

" == Language Specific Highlighting =======================

" html
hi      htmlLink                guifg=#93A1A1 ctermfg=247 gui=underline cterm=underline
hi link htmlTag                 Tag
hi link htmlHead                Tag
hi link htmlSpecialTagName      Tag
hi link htmlEndTag              Tag
hi link htmlTagN                Tag
hi link htmlArg                 Function

hi htmlBoldItalic               gui=bold,italic             cterm=bold,italic
hi htmlBoldUnderline            gui=bold,underline          cterm=bold,underline
hi htmlBoldUnderlineItalic      gui=bold,underline,italic   cterm=bold,underline,italic
hi htmlItalic                   gui=italic                  cterm=italic
hi htmlUnderline                gui=underline               cterm=underline
hi htmlUnderlineItalic          gui=underline,italic        cterm=underline,italic

" css
hi link cssImportant            Error
hi link cssPseudoClass          Tag
hi link cssPseudoClassId        Tag
hi link cssStringQ              Boolean
hi link cssAttr                 Boolean
hi link cssFontAttr             Boolean
hi link cssCommonAttr           Boolean
hi link cssColor                Boolean
hi link cssDefinition           Boolean
hi link cssStringQQ             Boolean
hi link cssProp                 Define
hi link cssTextProp             Define
hi link cssFontProp             Define
hi link cssBoxProp              Define
hi link cssRenderProp           Define
hi link cssColorProp            Define
hi link cssTableProp            Define
hi link cssUiProp               Define
hi link cssGeneratedContentProp Define

" Ruby
hi link rubySharpBang           Normal
hi link rubyControl             Comment

" Javascript
hi link javaScriptNumber        Boolean
hi link javaScriptRegexpString  Boolean
hi link javaScriptPrototype     Type        " prototype
hi link javaScriptType          Type        " const undefined void yield
hi link javaScriptIdentifier    Identifier  " var this
hi link javaScriptLabel         Label       " length
hi link javaScriptGlobalObjects Class
hi link javaScriptFunction      Statement
hi link javaScriptSource        Statement   " import export
hi link javaScriptOperator      Statement   " delete new in instanceof let typeof
hi link javaScriptBoolean       Statement   " true false
hi link javaScriptNull          Statement   " null
hi link javaScriptConditional   Statement   " if else
hi link javaScriptRepeat        Statement   " do while for
hi link javaScriptBranch        Statement   " break continue switch case default return
hi link javaScriptStatement     Statement   " try catch throw with finally
hi link javascriptEnvComment    Comment     " executable
