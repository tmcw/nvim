set t_Co=256

call pathogen#infect()
set nocompatible
syntax enable
filetype plugin indent on

set showmatch
set ruler
set number
set nowrap
set hlsearch
set colorcolumn=80

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>. :tabnext<cr>
nmap <leader>/ :tabnext<cr>

" Default indentation
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

"SECTION: NERDTree Customization
" \d will hide/show
" \b will enter :NERDTreeFromBookmark and then
" you can autocomplete the name of a bookmark
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>gu :GundoToggle<CR>
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.pyc$', 'CVS', '\~$']

" Colorscheme
set background=dark
colorscheme Tomorrow-Night
if has("gui_running")
  set go-=T
  set guifont=M+_1m:h13
  set noballooneval
else
  set mouse=a
endif

" Javascript
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *._ set filetype=html

autocmd BufRead,BufNewFile *.mss set syntax=carto
autocmd BufRead,BufNewFile *.md set filetype=markdown

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes = ['cpp']

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

nnoremap <leader>gpp :Git push origin master --tags<cr>
nnoremap <leader>gph :Git push origin gh-pages --tags<cr>

set backupdir=/Users/tmcw/tmp/
set directory=/Users/tmcw/tmp/
set nobackup
set nowritebackup

" Settings for VimClojure
let g:clj_highlight_builtins=1      " Highlight Clojure's builtins
let g:clj_paren_rainbow=1           " Rainbow parentheses'!
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1

function! HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
endfunction

function! HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction

noremap <silent> <c-h> :call HtmlEscape()<CR>
noremap <silent> <c-u> :call HtmlUnEscape()<CR>

nnoremap <silent> <c-o> :CtrlPMRU<Cr>

" Show syntax highlighting groups for word under cursor
function! <SID>SynStack ()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
noremap   <F3> :call <SID>SynStack()<CR>
inoremap  <F3> :call <SID>SynStack()<CR>

function! DFW()
    colorscheme Tomorrow
    set background=light
    set lines=40 columns=100           " size of the editable area
    set fuoptions=background:#00f5f6f6 " macvim specific setting for editor's background color
    set guioptions-=r                  " remove right scrollbar
    set laststatus=0                   " don't show status line
    set noruler                        " don't show ruler
    set fullscreen                     " go to fullscreen editing mode
    set linebreak                      " break the lines on words
    set colorcolumn=
    set nonumber
endfunction

let g:ctrlp_extensions = ['line']
let g:ctrlp_user_command = 'mdfind -onlyin %s file'

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
