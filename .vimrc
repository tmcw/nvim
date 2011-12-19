set t_Co=256

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible
syntax enable
filetype on
filetype plugin on
filetype plugin indent on
set showmatch
set ruler
set number
set hlsearch
set cursorline

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

set shell=/bin/bash

"SECTION: NERDTree Customization
" \d will hide/show
" \b will enter :NERDTreeFromBookmark and then
" you can autocomplete the name of a bookmark
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>b :NERDTreeFromBookmark
let NERDTreeIgnore=['\.pyc$', 'CVS', '\~$']

" Colorscheme
colorscheme molokai
if has("gui_running")
  " colorscheme tombat
  " colorscheme xoria256
  if strftime("%u", localtime()) > 5
      colorscheme xoria256
  else
      colorscheme kod
  endif
  set go-=T
  set guifont=M+_1m_thin:h14
  " set guifont=M+_1mn:h12
  " set guifont=Meslo_LG_L_DZ:h12
endif

" Javascript
au BufNewFile,BufRead *.bones set filetype=javascript
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *._ set filetype=html
au BufNewFile,BufRead *.ejs set filetype=html

autocmd BufRead,BufNewFile *.mss set syntax=carto
autocmd BufRead,BufNewFile *.md set filetype=markdown

autocmd BufRead,BufNewFile *.css set tabstop=2 | set shiftwidth=2
autocmd BufRead,BufNewFile *.html set tabstop=2 | set shiftwidth=2

autocmd BufRead,BufNewFile *.hbs set tabstop=2 | set shiftwidth=2
" Use the arrows to something usefull
map <right> :tabnext<cr>
map <left> :tabp<cr>

augroup filetype
    au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=%-16(\ %l,%c-%v\ %)%P

let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes = ['cpp']

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

command! BIGMONITOR set guifont=M+_1mn:h12
command! GPP ! git push origin master
command! GPH ! git push origin gh-pages

nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gpp :Git push origin master<cr>
nnoremap <leader>gph :Git push origin gh-pages<cr>

au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set tags+=~/.vim/libtags/libstd
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
