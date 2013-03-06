silent! call pathogen#infect()

syntax enable
filetype plugin indent on

set t_Co=256
set vb
set nocompatible
set showmatch
set ruler
set number
set nowrap
set hlsearch
set colorcolumn=80
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

" never ever write temporary files into file directories
set backupdir=/Users/tmcw/tmp/
set directory=/Users/tmcw/tmp/
set nobackup
set nowritebackup

nmap <leader>. :tabnext<cr>
nmap <leader>/ :tabnext<cr>

inoremap <expr><TAB>  pumvisible() ? "<C-n>" : "<TAB>"
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>a :Ack 

let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.pyc$', 'CVS', '\~$']
let NERDTreeHijackNetrw=1

highlight clear SignColumn

set background=dark
colorscheme tombat
if has("gui_running")
  set go-=T
  set guifont=M+_1mn_light:h13
  set noballooneval
else
  set mouse=a
endif

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufRead,BufNewFile *.mml set syntax=javascript
autocmd BufRead,BufNewFile *.bones set syntax=javascript
autocmd BufRead,BufNewFile *.result set syntax=xml
autocmd BufRead,BufNewFile *.md set filetype=markdown
au BufNewFile,BufRead *._ set filetype=html

" Show syntax highlighting groups for word under cursor
nmap <C-S-A> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Statusline helper
if has("eval")
function! SL(function)
  if exists('*'.a:function)
    return call(a:function,[])
  else
    return ''
  endif
endfunction
endif

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{SL('fugitive#statusline')}%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P

let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes = ['cpp']

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

let g:ctrlp_extensions = ['line']
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:solarized_contrast="low"

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

map <leader>gu :GundoToggle<CR>

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
