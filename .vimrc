call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible
syntax enable
filetype on
filetype plugin on
filetype plugin indent on
set showmatch
set ruler
set hlsearch
set nonumber

" Default indentation
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

set shell=/bin/bash

"SECTION: NERDTree Customization
" \d will hide/show
" \b will enter :NERDTreeFromBookmark and then
" you can autocomplete the name of a bookmark
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>b :NERDTreeFromBookmark
let NERDTreeIgnore=['\.pyc$', 'CVS', '\~$']

" Colorscheme
colorscheme tombat
if has("gui_running")
  colorscheme h3rald
  set go-=T
  set guifont=M+_1mn:h12
endif

" Javascript
au BufNewFile,BufRead *.bones set filetype=javascript
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *._ set filetype=html
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.js set makeprg=fixjsstyle\ %
au BufNewFile,BufRead *.js set errorformat=%-P-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ E:%n:\ %m,%-Q,%-GFound\ %s,%-GSome\ %s,%-Gfixjsstyle%s,%-Gscript\ can\ %s,%-G

autocmd BufRead,BufNewFile *.mss set syntax=carto

autocmd BufRead,BufNewFile *.css set tabstop=2 | set shiftwidth=2
autocmd BufRead,BufNewFile *.html set tabstop=2 | set shiftwidth=2
autocmd BufRead,BufNewFile *.hbs set tabstop=2 | set shiftwidth=2

augroup hbs
  autocmd BufRead *.hbs set filetype=html
augroup END

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-16(\ %l,%c-%v\ %)%P

" gist-vim
" mac
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
