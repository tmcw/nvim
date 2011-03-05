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
set number

" Default indentation
set tabstop=4
set autoindent
set shiftwidth=4
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
  colorscheme tombat 
  set go-=T
  set guifont=M+_1mn:h14
endif

" Javascript
au BufNewFile,BufRead *.js set makeprg=fixjsstyle\ %
au BufNewFile,BufRead *.js set errorformat=%-P-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ E:%n:\ %m,%-Q,%-GFound\ %s,%-GSome\ %s,%-Gfixjsstyle%s,%-Gscript\ can\ %s,%-G
 
autocmd BufRead,BufNewFile *.mss set syntax=css

augroup module
  autocmd BufRead *.module set filetype=php comments=s1:/*,mb:*,ex:*/,://,:# formatoptions=lqrowcb
augroup END

augroup inc
  autocmd BufRead *.inc set filetype=php comments=s1:/*,mb:*,ex:*/,://,:# formatoptions=lqrowcb
augroup END

augroup hbs
  autocmd BufRead *.hbs set filetype=html
augroup END

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-16(\ %l,%c-%v\ %)%P

" gist-vim

" mac
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
