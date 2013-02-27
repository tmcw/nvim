" Vim color file, started as a fork of bluegreen and changed beyond any recognition
" Maintainer:   Sergey Khorev <sergey.khorev@gmail.com>
" Last Change:  $HGLastChangedDate: 2012-12-07 10:42 +0400 $
" URL: http://www.vim.org/scripts/script.php?script_id=586
"      http://sites.google.com/site/khorser/opensource/vim
" if your text terminal supports font attributes like bold you might want
" to set g:CtermAttrs = 1 for better results

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="northsky"

hi Normal	guifg=white guibg=#061a3e gui=none

hi Search	guifg=NONE guibg=#3d5b8c gui=none
hi IncSearch	guifg=NONE guibg=NONE gui=inverse

hi Cursor	guifg=#e3e3e3 guibg=#d74141 gui=none
hi lCursor	guifg=NONE guibg=SeaGreen1 gui=none

hi VertSplit	guifg=tan guibg=#800080 gui=none

hi Folded	guifg=plum1 guibg=#061a3e gui=none
hi FoldColumn	guifg=DimGrey guibg=#241572 gui=none
hi ModeMsg	guifg=#404040 guibg=#c0c0c0 gui=bold
hi MoreMsg	guifg=darkturquoise guibg=#188f90 gui=bold
hi NonText	guifg=#9fadc5 guibg=#334c75 gui=none
hi Question	guifg=#f4bb7e guibg=NONE gui=bold

hi SpecialKey	guifg=#bf9261 guibg=NONE gui=none
hi StatusLine	guifg=cyan guibg=#067c7b gui=none
hi StatusLineNC	guifg=DimGrey guibg=#004443 gui=none
hi Title	guifg=#8db8c3 gui=bold
hi Visual	guifg=NONE guibg=#2b5547 gui=none
hi VisualNOS	guibg=#628262 gui=bold
hi WarningMsg	guifg=#f60000 gui=underline

hi Comment	guifg=DarkGray guibg=NONE gui=none
hi Constant	guifg=#72a5e4 guibg=NONE gui=none
hi Number	guifg=chartreuse2 guibg=NONE gui=none
hi Identifier	guifg=#72c8e4 guibg=NONE gui=none
hi Statement	guifg=yellow guibg=NONE gui=none
hi PreProc	guifg=#14a87c guibg=NONE gui=none
hi Type		guifg=#ffae66 guibg=NONE gui=none
hi Special	guifg=#ffc0c0 guibg=NONE gui=none
hi Ignore	guifg=grey60 guibg=NONE gui=none
hi Todo		guifg=#244c0a guibg=#9c8c84 gui=none
hi Label	guifg=HotPink2 guibg=NONE gui=none

hi WildMenu	guifg=Black guibg=Yellow gui=none

hi Error	guifg=Red guibg=NONE gui=none
hi ErrorMsg	guifg=White guibg=DarkRed gui=none
hi DiffAdd	guifg=NONE guibg=DarkBlue gui=none
hi DiffDelete	guifg=Yellow guibg=DarkBlue gui=none
hi DiffChange	guifg=NONE guibg=#0b2349 gui=none
hi DiffText	guifg=NONE guibg=#565076 gui=none

hi Directory	guifg=Cyan guibg=NONE gui=none
hi LineNr	guifg=DarkSeaGreen guibg=NONE gui=none

hi SignColumn   guifg=Cyan guibg=gray39 gui=none

hi PmenuThumb	guifg=gray20 gui=none
hi PmenuSbar	guibg=gray39 gui=none
hi PmenuSel	guifg=lightcyan guibg=blue gui=bold
hi Pmenu	guifg=black guibg=darkgray gui=none

hi Underlined	gui=underline guifg=#80a0ff guibg=NONE

hi MatchParen   guifg=bg guibg=#2365B6 gui=none

hi CursorColumn	guifg=NONE guibg=#102F54 gui=none
hi CursorLine	guifg=NONE guibg=#071F49 gui=none

hi TabLine	guifg=white guibg=gray20 gui=none
hi TabLineSel	guifg=black guibg=white gui=bold
hi TabLineFill	guibg=gray20 gui=none

hi User1	guifg=black guibg=#004443 gui=none
hi User2	guifg=blue guibg=lightblue gui=bold

" hi ColorColumn  guibg=DarkRed
" hi Conceal	  guifg=LightGrey guibg=DarkGrey
" hi CursorLineNr gui=bold guifg=Yellow
" hi SpellBad	  gui=undercurl guisp=Red
" hi SpellCap	  gui=undercurl guisp=Blue
" hi SpellLocal	  gui=undercurl guisp=Cyan
" hi SpellRare	  gui=undercurl guisp=Magenta

" terminal with bold, italic etc attrs
" disabled for now
if 0 " exists('g:CtermAttrs') && g:CtermAttrs
  hi Normal	ctermfg=lightgray ctermbg=black cterm=none

  hi Search	ctermfg=yellow ctermbg=darkblue cterm=bold
  hi IncSearch	ctermfg=bg ctermbg=cyan cterm=bold

  hi Cursor	ctermfg=white ctermbg=red cterm=none
  hi lCursor	ctermfg=NONE ctermbg=lightgreen " cterm=none

  hi VertSplit	ctermfg=darkblue ctermbg=cyan cterm=none

  hi Folded	ctermfg=magenta ctermbg=bg cterm=none
  hi FoldColumn	ctermfg=lightgray ctermbg=darkmagenta cterm=none
  hi ModeMsg	ctermfg=black ctermbg=gray cterm=bold
  hi MoreMsg	ctermfg=darkblue ctermbg=darkcyan cterm=none
  hi NonText	ctermfg=gray ctermbg=darkblue cterm=none
  hi Question	ctermfg=yellow cterm=none

  hi SpecialKey	ctermfg=brown cterm=none
  hi StatusLine	ctermfg=darkblue ctermbg=darkcyan cterm=bold
  hi StatusLineNC ctermfg=black ctermbg=darkgray cterm=bold
  hi Title	ctermfg=blue cterm=none
  hi Visual	ctermfg=black ctermbg=darkgreen cterm=none
  hi VisualNOS	cterm=underline,bold
  hi WarningMsg	ctermfg=red cterm=none

  hi Comment	ctermfg=darkgray cterm=none
  hi Constant   ctermfg=cyan term=none
  hi Number	ctermfg=green cterm=bold
  hi Identifier	ctermfg=white cterm=bold
  hi Statement	ctermfg=yellow cterm=bold
  hi PreProc	ctermfg=darkgreen cterm=none
  hi Type	ctermfg=darkmagenta cterm=bold
  hi Special	ctermfg=darkmagenta cterm=none
  hi Ignore	ctermfg=gray cterm=none
  hi Todo	ctermfg=darkblue ctermbg=lightgray cterm=none
  hi Label	ctermfg=yellow cterm=none

  hi WildMenu	cterm=bold

  hi Error	ctermfg=white ctermbg=red cterm=bold
  hi ErrorMsg   ctermfg=white ctermbg=darkred cterm=none
  hi DiffAdd    ctermfg=white ctermbg=DarkBlue cterm=none
  hi DiffDelete ctermfg=yellow ctermbg=darkblue cterm=bold
  hi DiffChange ctermbg=DarkMagenta cterm=none
  hi DiffText   cterm=bold ctermbg=Red

  hi Directory	ctermfg=darkcyan cterm=none
  hi LineNr	ctermfg=blue cterm=none

  hi SignColumn	ctermfg=Cyan ctermbg=DarkGrey

  hi PmenuThumb ctermbg=black cterm=none
  hi PmenuSbar	ctermbg=lightgray cterm=none
  hi PmenuSel	ctermfg=white ctermbg=darkblue cterm=bold
  hi Pmenu	ctermfg=black ctermbg=darkgray cterm=bold

  hi Underlined	ctermfg=lightblue cterm=bold,underline

  hi MatchParen  ctermfg=bg ctermbg=DarkGray

  "hi CursorColumn
  "hi CursorLine

  hi TabLine	ctermfg=82 ctermbg=15 cterm=underline
  hi TabLineSel	ctermbg=15 ctermbg=82 cterm=bold
  hi TabLineFill cterm=inverse

  "hi User1
  "hi User2 ctermfg=darkblue ctermbg=blue cterm=bold

  " hi ColorColumn
  " hi Conceal
  " hi CursorLineNr
  " hi SpellBad
  " hi SpellCap
  " hi SpellLocal
  " hi SpellRare
elseif &t_Co == 256
  hi Normal	cterm=NONE ctermbg=16 ctermfg=231

  hi Search	cterm=NONE ctermbg=24 ctermfg=fg
  hi IncSearch	cterm=reverse ctermbg=bg ctermfg=fg

  hi Cursor	cterm=NONE ctermbg=167 ctermfg=254
  hi lCursor	cterm=NONE ctermbg=85 ctermfg=fg

  hi VertSplit	cterm=NONE ctermbg=90 ctermfg=180

  hi Folded	cterm=NONE ctermbg=17 ctermfg=219
  hi FoldColumn cterm=NONE ctermbg=17 ctermfg=242
  hi ModeMsg	cterm=bold ctermbg=250 ctermfg=238
  hi MoreMsg	cterm=bold ctermbg=30 ctermfg=44
  hi NonText	cterm=NONE ctermbg=60 ctermfg=146
  hi Question	cterm=bold ctermbg=bg ctermfg=216

  hi SpecialKey cterm=NONE ctermbg=bg ctermfg=137
  hi StatusLine cterm=NONE ctermbg=30 ctermfg=51
  hi StatusLineNC cterm=NONE ctermbg=23 ctermfg=246
  hi Title	cterm=bold ctermbg=bg ctermfg=109
  hi Visual	cterm=NONE ctermbg=23 ctermfg=fg
  hi VisualNOS	cterm=bold ctermbg=65 ctermfg=fg
  hi WarningMsg cterm=underline ctermbg=bg ctermfg=196

  hi Comment	cterm=NONE ctermbg=bg ctermfg=248
  hi Constant	cterm=NONE ctermbg=bg ctermfg=69
  hi Number	cterm=NONE ctermbg=bg ctermfg=46
  hi Identifier cterm=NONE ctermbg=bg ctermfg=80
  hi Statement	cterm=NONE ctermbg=bg ctermfg=226
  hi PreProc	cterm=NONE ctermbg=bg ctermfg=36
  hi Type	cterm=NONE ctermbg=bg ctermfg=215
  hi Special	cterm=NONE ctermbg=bg ctermfg=217
  hi Ignore	cterm=NONE ctermbg=bg ctermfg=246
  hi Todo	cterm=NONE ctermbg=138 ctermfg=22
  hi Label	cterm=NONE ctermbg=bg ctermfg=205

  hi WildMenu	cterm=NONE ctermbg=226 ctermfg=16

  hi Error	cterm=NONE ctermbg=bg ctermfg=196
  hi ErrorMsg	cterm=NONE ctermbg=88 ctermfg=231
  hi DiffAdd	cterm=NONE ctermbg=18 ctermfg=fg
  hi DiffDelete cterm=NONE ctermbg=18 ctermfg=226
  hi DiffChange cterm=NONE ctermbg=17 ctermfg=fg
  hi DiffText	cterm=NONE ctermbg=60 ctermfg=fg

  hi Directory	cterm=NONE ctermbg=bg ctermfg=51
  hi LineNr	cterm=NONE ctermbg=bg ctermfg=108

  hi SignColumn cterm=NONE ctermbg=241 ctermfg=51

  hi PmenuThumb cterm=NONE ctermfg=238 ctermbg=bg
  hi PmenuSbar	cterm=NONE ctermbg=241 ctermfg=fg
  hi PmenuSel	cterm=bold ctermbg=21 ctermfg=195
  hi Pmenu	cterm=NONE ctermbg=248 ctermfg=16

  hi Underlined cterm=underline ctermbg=bg ctermfg=111

  hi MatchParen cterm=NONE ctermbg=26 ctermfg=16

  hi CursorColumn cterm=NONE ctermbg=17 ctermfg=fg
  hi CursorLine cterm=NONE ctermbg=17 ctermfg=fg

  hi TabLine	cterm=NONE ctermbg=236 ctermfg=231
  hi TabLineSel cterm=bold ctermbg=231 ctermfg=16
  hi TabLineFill cterm=NONE ctermbg=236 ctermfg=fg

  hi User1	cterm=NONE ctermbg=23 ctermfg=16
  hi User2	cterm=bold ctermbg=152 ctermfg=21

  " hi ColorColumn cterm=NONE ctermbg=88 ctermfg=fg
  " hi Conceal cterm=NONE ctermbg=248 ctermfg=252
  " hi CursorLineNr cterm=bold ctermbg=bg ctermfg=226
  " hi SpellBad cterm=undercurl ctermbg=bg ctermfg=196
  " hi SpellCap cterm=undercurl ctermbg=bg ctermfg=21
  " hi SpellLocal cterm=undercurl ctermbg=bg ctermfg=51
  " hi SpellRare cterm=undercurl ctermbg=bg ctermfg=201
elseif &t_Co == 88
  hi Normal	cterm=NONE ctermbg=16 ctermfg=79

  hi Search	cterm=NONE ctermbg=22 ctermfg=fg
  hi IncSearch	cterm=reverse ctermbg=bg ctermfg=fg

  hi Cursor	cterm=NONE ctermbg=48 ctermfg=87
  hi lCursor	cterm=NONE ctermbg=45 ctermfg=fg

  hi VertSplit	cterm=NONE ctermbg=33 ctermfg=57

  hi Folded	cterm=NONE ctermbg=16 ctermfg=75
  hi FoldColumn cterm=NONE ctermbg=17 ctermfg=83
  hi ModeMsg	cterm=bold ctermbg=85 ctermfg=80
  hi MoreMsg	cterm=bold ctermbg=21 ctermfg=26
  hi NonText	cterm=NONE ctermbg=17 ctermfg=81
  hi Question	cterm=bold ctermbg=bg ctermfg=73

  hi SpecialKey cterm=NONE ctermbg=bg ctermfg=53
  hi StatusLine cterm=NONE ctermbg=21 ctermfg=31
  hi StatusLineNC cterm=NONE ctermbg=16 ctermfg=82
  hi Title	cterm=bold ctermbg=bg ctermfg=42
  hi Visual	cterm=NONE ctermbg=20 ctermfg=fg
  hi VisualNOS	cterm=bold ctermbg=21 ctermfg=fg
  hi WarningMsg cterm=underline ctermbg=bg ctermfg=64

  hi Comment	cterm=NONE ctermbg=bg ctermfg=84
  hi Constant	cterm=NONE ctermbg=bg ctermfg=23
  hi Number	cterm=NONE ctermbg=bg ctermfg=44
  hi Identifier cterm=NONE ctermbg=bg ctermfg=22
  hi Statement	cterm=NONE ctermbg=bg ctermfg=76
  hi PreProc	cterm=NONE ctermbg=bg ctermfg=21
  hi Type	cterm=NONE ctermbg=bg ctermfg=52
  hi Special	cterm=NONE ctermbg=bg ctermfg=74
  hi Ignore	cterm=NONE ctermbg=bg ctermfg=84
  hi Todo	cterm=NONE ctermbg=37 ctermfg=16
  hi Label	cterm=NONE ctermbg=bg ctermfg=05

  hi WildMenu	cterm=NONE ctermbg=76 ctermfg=16

  hi Error	cterm=NONE ctermbg=bg ctermfg=64
  hi ErrorMsg	cterm=NONE ctermbg=32 ctermfg=79
  hi DiffAdd	cterm=NONE ctermbg=17 ctermfg=fg
  hi DiffDelete cterm=NONE ctermbg=17 ctermfg=76
  hi DiffChange cterm=NONE ctermbg=16 ctermfg=fg
  hi DiffText	cterm=NONE ctermbg=38 ctermfg=fg

  hi Directory	cterm=NONE ctermbg=bg ctermfg=31
  hi LineNr	cterm=NONE ctermbg=bg ctermfg=41

  hi SignColumn cterm=NONE ctermbg=81 ctermfg=31

  hi PmenuThumb cterm=NONE ctermbg=00 ctermfg=80
  hi PmenuSbar	cterm=NONE ctermbg=81 ctermfg=fg
  hi PmenuSel	cterm=bold ctermbg=19 ctermfg=63
  hi Pmenu	cterm=NONE ctermbg=84 ctermfg=16

  hi Underlined cterm=underline ctermbg=bg ctermfg=39

  hi MatchParen cterm=NONE ctermbg=22 ctermfg=16

  hi CursorColumn cterm=NONE ctermbg=17 ctermfg=fg
  hi CursorLine cterm=NONE ctermbg=17 ctermfg=fg

  hi TabLine	cterm=NONE ctermbg=80 ctermfg=79
  hi TabLineSel cterm=bold ctermbg=79 ctermfg=16
  hi TabLineFill  cterm=NONE ctermbg=80 ctermfg=fg

  hi User1	cterm=NONE ctermbg=20 ctermfg=16
  hi User2	cterm=bold ctermbg=58 ctermfg=19

  " hi ColorColumn cterm=NONE ctermbg=32 ctermfg=fg
  " hi Conceal cterm=NONE ctermbg=84 ctermfg=86
  " hi CursorLineNr cterm=bold ctermbg=bg ctermfg=76
  " hi SpellBad cterm=undercurl ctermbg=bg ctermfg=64
  " hi SpellCap cterm=undercurl ctermbg=bg ctermfg=19
  " hi SpellLocal cterm=undercurl ctermbg=bg ctermfg=31
  " hi SpellRare cterm=undercurl ctermbg=bg ctermfg=67
elseif &t_Co == 16 && has('win32')  " windows console

  hi Normal	ctermfg=7 ctermbg=0

  hi Search	ctermfg=15 ctermbg=1 cterm=NONE
  hi IncSearch	ctermfg=NONE ctermbg=NONE cterm=reverse

  "hi Cursor	ctermfg=1 cterm=NONE
  "hi lCursor	ctermfg=0 ctermbg=2*

  hi VertSplit	ctermfg=6 ctermbg=5 cterm=NONE

  hi Folded	ctermfg=5 ctermbg=0 cterm=NONE
  hi FoldColumn	ctermfg=7 ctermbg=1 cterm=NONE
  hi ModeMsg	ctermfg=0 ctermbg=7 cterm=NONE
  hi MoreMsg	ctermfg=11 ctermbg=3 cterm=NONE
  hi NonText	ctermfg=7 ctermbg=1 cterm=NONE
  hi Question	ctermfg=6 ctermbg=0 cterm=NONE

  hi SpecialKey	ctermfg=5 cterm=NONE
  hi StatusLine	ctermfg=11 ctermbg=3 cterm=NONE
  hi StatusLineNC ctermfg=16 ctermbg=2 cterm=NONE
  hi Title	ctermfg=3 ctermbg=0 cterm=NONE
  hi Visual	ctermfg=none ctermbg=2 cterm=NONE
  hi VisualNOS	ctermfg=none ctermbg=2 cterm=NONE
  hi WarningMsg	ctermfg=4 ctermbg=0 cterm=NONE

  hi Comment	ctermfg=8 ctermbg=0 cterm=NONE
  hi Constant	ctermfg=9 ctermbg=0 cterm=NONE
  hi Number	ctermfg=10 cterm=NONE
  hi Identifier	ctermfg=11 cterm=NONE
  hi Statement	ctermfg=14 cterm=NONE
  hi PreProc	ctermfg=2 cterm=NONE
  hi Type	ctermfg=6 cterm=NONE
  hi Special	ctermfg=5 cterm=NONE
  hi Ignore	ctermfg=8 cterm=NONE
  hi Todo	ctermfg=1 ctermbg=6 cterm=NONE
  hi Label	ctermfg=13 cterm=NONE

  hi WildMenu	ctermbg=14 ctermfg=0 cterm=NONE

  hi Error	ctermfg=12 ctermbg=0 cterm=NONE
  hi ErrorMsg	ctermfg=7 ctermbg=4 cterm=NONE
  hi DiffAdd	ctermfg=none ctermbg=1 cterm=NONE
  hi DiffDelete	ctermfg=14 ctermbg=1 cterm=NONE
  hi DiffChange	ctermfg=none ctermbg=0 cterm=NONE
  hi DiffText	ctermfg=none ctermbg=08 cterm=NONE

  hi Directory	ctermfg=3 cterm=NONE
  hi LineNr	ctermfg=6 cterm=NONE

  hi SignColumn	ctermfg=11 ctermbg=8 cterm=NONE

  hi PmenuThumb ctermfg=8 cterm=none
  hi PmenuSbar	ctermbg=8 cterm=none
  hi PmenuSel	ctermfg=11 ctermbg=9 cterm=none
  hi Pmenu	ctermfg=0 ctermbg=8 cterm=none

  hi Underlined	ctermfg=9 ctermbg=0 cterm=none

  hi MatchParen ctermfg=0 ctermbg=9 cterm=NONE

  "hi CursorColumn
  "hi CursorLine

  hi TabLine	ctermfg=15 ctermbg=8 cterm=none
  hi TabLineSel ctermfg=0 ctermbg=15 cterm=none
  hi TabLineFill ctermbg=8 cterm=none

  hi User1	ctermfg=0 ctermbg=3 cterm=none
  hi User2	ctermfg=1 ctermbg=8 cterm=none

  " hi ColorColumn
  " hi Conceal
  " hi CursorLineNr
  " hi SpellBad
  " hi SpellCap
  " hi SpellLocal
  " hi SpellRare
else " assuming &t_Co == 8 with bold handled as light color switch

  hi Normal	ctermfg=7 ctermbg=0 cterm=NONE

  hi Search	ctermfg=NONE ctermbg=4 cterm=NONE
  hi IncSearch	ctermfg=NONE ctermbg=NONE cterm=inverse

  "hi Cursor	ctermfg=1 cterm=NONE
  "hi lCursor	ctermfg=0 ctermbg=2*

  hi VertSplit	ctermfg=3 ctermbg=5 cterm=bold

  hi Folded	ctermfg=5 ctermbg=0 cterm=NONE
  hi FoldColumn	ctermfg=7 ctermbg=4 cterm=NONE
  hi ModeMsg	ctermfg=0 ctermbg=7 cterm=NONE
  hi MoreMsg	ctermfg=6 ctermbg=6 cterm=bold
  hi NonText	ctermbg=4 ctermfg=0 cterm=bold
  hi Question	ctermfg=3 ctermbg=0 cterm=bold

  hi SpecialKey	ctermfg=3 ctermbg=0 cterm=NONE
  hi StatusLine	ctermfg=6 ctermbg=6 cterm=bold
  hi StatusLineNC ctermfg=0 ctermbg=6 cterm=NONE
  hi Title	ctermfg=6 ctermbg=0 cterm=none
  hi Visual	ctermfg=NONE ctermbg=2 cterm=bold
  hi VisualNOS	ctermfg=NONE ctermbg=2 cterm=underline,bold
  hi WarningMsg	ctermfg=1 ctermbg=0 cterm=NONE

  hi Comment	ctermfg=0 cterm=bold
  hi Constant	ctermfg=4 cterm=NONE
  hi Number	ctermfg=2 cterm=bold
  hi Identifier	ctermfg=6 cterm=NONE
  hi Statement	ctermfg=3 cterm=bold
  hi PreProc	ctermfg=2 cterm=NONE
  hi Type	ctermfg=3 cterm=NONE
  hi Special	ctermfg=5 cterm=bold
  hi Ignore	ctermfg=0 cterm=bold
  hi Todo	ctermfg=4 ctermbg=3 cterm=NONE
  hi Label	ctermfg=1 cterm=bold

  hi WildMenu	ctermbg=3 cterm=NONE ctermfg=0

  hi Error	ctermfg=1 ctermbg=0 cterm=none
  hi ErrorMsg	ctermfg=7 ctermbg=1 cterm=bold
  hi DiffAdd	ctermfg=NONE ctermbg=4 cterm=bold
  hi DiffDelete	ctermfg=3 ctermbg=4 cterm=NONE
  hi DiffChange	ctermfg=NONE ctermbg=0
  hi DiffText	ctermfg=NONE ctermbg=5

  hi Directory	ctermfg=6 cterm=NONE
  hi LineNr	ctermfg=2 cterm=NONE

  hi SignColumn	ctermfg=6 ctermbg=7 cterm=NONE

  hi PmenuThumb ctermfg=7 ctermbg=0 cterm=none
  hi PmenuSbar	ctermbg=7 cterm=bold ctermfg=7
  hi PmenuSel	ctermfg=6 ctermbg=4 cterm=bold
  hi Pmenu	ctermfg=0 ctermbg=7 cterm=none

  hi Underlined	ctermfg=4 cterm=bold,underline

  hi MatchParen ctermfg=6 ctermbg=4 cterm=none

  "hi CursorColumn
  "hi CursorLine

  hi TabLine	ctermfg=7 ctermbg=0 cterm=bold
  hi TabLineSel ctermfg=0 ctermbg=7 cterm=none
  hi TabLineFill cterm=none ctermfg=7

  hi User1	ctermfg=0 ctermbg=06 cterm=none
  hi User2	ctermfg=4 ctermbg=7 cterm=none

  " hi ColorColumn
  " hi Conceal
  " hi CursorLineNr
  " hi SpellBad
  " hi SpellCap
  " hi SpellLocal
  " hi SpellRare
endif

" vim: set ts=8 sw=2 sts=2 ff=unix:
