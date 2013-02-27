set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "twokthirteen"

let s:vmode = "gui"
let s:base0 = "#002b36"
let s:back = "#222222"

exe "let s:fg_base0 = ' ".s:vmode."fg=".s:base0 ."'"
exe "let s:bg_back = ' ".s:vmode."bg=".s:back."'"

exe "hi! Normal gui=NONE term=NONE" .s:fmt_none .s:fg_base0 .s:bg_back
