set t_Co=256
set vb

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

" Fast saving
nmap <leader>. :tabnext<cr>
nmap <leader>/ :tabnext<cr>

" Default indentation
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
let g:neocomplcache_enable_at_startup = 1

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"SECTION: NERDTree Customization
" \d will hide/show
" \b will enter :NERDTreeFromBookmark and then
" you can autocomplete the name of a bookmark
nnoremap <leader>d :NERDTreeToggle<cr>
map <leader>gu :GundoToggle<CR>
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.pyc$', 'CVS', '\~$']

" Colorscheme
set background=dark
colorscheme Tomorrow-Night
if has("gui_running")
  set go-=T
  set guifont=M+_1m_light:h13
  set noballooneval
else
  set mouse=a
endif

" Javascript
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufRead,BufNewFile *.mml set syntax=javascript
autocmd BufRead,BufNewFile *.bones set syntax=javascript

autocmd BufRead,BufNewFile *.result set syntax=xml

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

nnoremap <leader>w :! git pull origin master && git push origin master --tags<cr>
nnoremap <leader>e :! git pull origin gh-pages && git push origin gh-pages --tags<cr>

set backupdir=/Users/tmcw/tmp/
set directory=/Users/tmcw/tmp/
set nobackup
set nowritebackup

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
let g:ackprg = 'ag --nogroup --nocolor --column'

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
