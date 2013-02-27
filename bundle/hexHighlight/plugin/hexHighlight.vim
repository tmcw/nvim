"gvim plugin for highlighting hex codes to help with tweaking colors
"Last Change: 2010 Dec 21
"Maintainer: Yuri Feldman <yuri@tbqh.net>
"License: WTFPL - Do What The Fuck You Want To Public License.
"Email me if you'd like.
if exists('g:loaded_hexHighlight') || v:version < 700
    finish
endif
let s:HexColored = 0
let s:HexColors = []

nnoremap <Plug>HexHighlightToggle :<C-u>call <SID>HexHighlightToggle()<CR>
if ! hasmapto('<Plug>HexHighlightToggle', 'n')
    nmap <Leader><F2> <Plug>HexHighlightToggle
endif

nnoremap <Plug>HexHighlightRefresh :<C-u>call <SID>HexHighlightRefresh()<CR>
if ! hasmapto('<Plug>HexHighlightRefresh', 'n')
    nmap <Leader>[ <Plug>HexHighlightRefresh
endif

nnoremap <Plug>RefreshColorScheme :<C-u>call <SID>RefreshColorScheme()<CR>
if ! hasmapto('<Plug>RefreshColorScheme', 'n')
    nmap <Leader>p <Plug>RefreshColorScheme
endif

function! s:RefreshColorScheme()
    exe 'w'
    exe 'colorscheme ' . g:colors_name
endfunction
command! -nargs=? HCT         call s:HighlightCTerms()
command! -nargs=? HHC         call s:HighlightHexCodes()
command! -nargs=? RCS         call s:RefreshColorScheme()

function! s:HighlightHexCodes()
    let lineNumber = 0
    let matchno = 4
    while lineNumber <= line("$")
        let currentLine = getline(lineNumber)

        if match(currentLine, '\v^\s*hi(light)?') != -1
            let hiNameIndex = matchend(currentLine, '\v^\s*hi(light)?')
            if hiNameIndex != -1
                let hiNameMatch = matchstr(currentLine, '\v\w+', hiNameIndex)
            endif

            let guibgIndex = matchend(currentLine, 'guibg=')
            if guibgIndex != -1
                let guibgMatch = matchstr(currentLine, '\v\S+', guibgIndex)
            else
                let guibgMatch = 'NONE'
            endif

            let guifgIndex = matchend(currentLine, 'guifg=')
            if guifgIndex != -1
                let guifgMatch = matchstr(currentLine, '\v\S+', guifgIndex)
            else
                let guifgMatch = 'NONE'
            endif

            let guiIndex = matchend(currentLine, 'gui=')
            if guiIndex != -1
                let guiMatch = matchstr(currentLine, '\v\S+', guiIndex)
            else
                let guiMatch = 'none'
            endif

            let guispIndex = matchend(currentLine, 'guisp=')
            if guispIndex != -1
                let guispMatch = matchstr(currentLine, '\v\S+', guispIndex)
            else
                let guispMatch = 'NONE'
            endif

            if guifgMatch != 'NONE' || guibgMatch != 'NONE' || guiMatch != 'none' || guispMatch != 'NONE'
                exec 'hi '.matchno.' guibg='.guibgMatch.' guifg='.guifgMatch.' gui='.guiMatch.' guisp='.guispMatch
                let m = matchadd(matchno, hiNameMatch)
                let matchno += 1
            endif
        endif
        let lineNumber += 1
    endwhile
endfunction

function! s:HighlightCTerms()
    let s = clearmatches()
     
    let lineNumber = 0
    let matchno = 4
    while lineNumber <= line("$")
        let currentLine = getline(lineNumber)

        if match(currentLine, '\v^\s*hi(light)?') != -1
            let hiNameIndex = matchend(currentLine, '\v^\s*hi(light)?')
            if hiNameIndex != -1
                let hiNameMatch = matchstr(currentLine, '\v\w+', hiNameIndex)
            endif

            let ctermbgIndex = matchend(currentLine, 'ctermbg=')
            if ctermbgIndex != -1 
                let ctermbgMatch = matchstr(currentLine, '\v\S+', ctermbgIndex)
            else
                let ctermbgMatch = 'none'
            endif

            let ctermfgIndex = matchend(currentLine, 'ctermfg=')
            if ctermfgIndex != -1
                let ctermfgMatch = matchstr(currentLine, '\v\S+', ctermfgIndex)
            else
                let ctermfgMatch = 'none'
            endif

            let ctermIndex = matchend(currentLine, 'cterm=')
            if ctermIndex != -1
                let ctermMatch = matchstr(currentLine, '\v\S+', ctermIndex)
            else
                let ctermMatch = 'none'
            endif

            if ctermfgMatch != 'none' || ctermbgMatch != 'none' || ctermMatch != 'none'
                exec 'hi '.matchno.' ctermbg='.ctermbgMatch.' ctermfg='.ctermfgMatch.' cterm='.ctermMatch
                let m = matchadd(matchno, hiNameMatch)
                let matchno += 1
            endif
        endif
        let lineNumber += 1
    endwhile
endfunction

function! s:HexHighlightRefresh()
    if ! has("gui_running")
        echo "hexHighlight only works with a graphical version of vim"
        return 0
    endif
    if s:HexColored == 0
        let s:HexColored = s:HexColorize()
        echo "Highlighting hex colors"
    elseif s:HexColored == 1
        call s:HexClear()
        let s:HexColored = s:HexColorize()
        echo "Refreshing hex colors"
    endif
endfunction

function! s:HexHighlightToggle()
    if ! has("gui_running")
        echo "hexHighlight only works with a graphical version of vim"
        return 0
    endif
    if s:HexColored == 0
        let s:HexColored = s:HexColorize()
        echo "Highlighting hex colors"
    elseif s:HexColored == 1
        let s:HexColored = s:HexClear()
        echo "Unhighlighting hex colors"
    endif
endfunction

function! s:HexClear()
    for hexColor in s:HexColors
        exe 'highlight clear '.hexColor
    endfor
    call clearmatches()
    return 0
endfunction

function! s:HexColorize()
    let hexGroup = 4
    let lineNumber = 0
    while lineNumber <= line("$")
        let currentLine = getline(lineNumber)
        let hexLineMatch = 1

        while match(currentLine, '#\x\{6}\|#\x\{3}', 0, hexLineMatch) != -1
            let hexMatch = matchstr(currentLine, '#\x\{6}\|#\x\{3}', 0, hexLineMatch)

            let hexColor=hexMatch
            if (strlen(hexMatch) == 4)
                let hexColor = '#' . substitute(strpart(hexMatch, 1), '.', '&&', 'g')
            endif

            let rPart = str2nr(strpart(hexColor, 1, 2), 16)
            let gPart = str2nr(strpart(hexColor, 3, 2), 16)
            let bPart = str2nr(strpart(hexColor, 5, 2), 16)

            if rPart > 127 || gPart > 127 || bPart > 127
                let hexComplement = "#000000"
            else
                let hexComplement = "#FFFFFF"
            end

            exe 'hi hexColor'.hexGroup.' guifg='.hexComplement.' guibg='.hexColor
            exe 'let m = matchadd("hexColor'.hexGroup.'", "'.hexColor.'", 25, '.hexGroup.')'
            let s:HexColors += ['hexColor'.hexGroup]
            let hexGroup += 1
            let hexLineMatch += 1
        endwhile

        let lineNumber += 1
    endwhile
    unlet lineNumber hexGroup
    return 1
endfunction
