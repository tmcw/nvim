silent! call pathogen#infect()

syntax enable
filetype plugin indent on

set t_Co=256
set vb
set number
set nocompatible
set showmatch
set ruler
set nowrap
set hlsearch
set colorcolumn=80
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set scrolloff=3
set wildignore+=node_modules
set backupdir=/Users/tmcw/tmp/
set directory=/Users/tmcw/tmp/
set nobackup
set nowritebackup

set laststatus=2
set timeout timeoutlen=1000 ttimeoutlen=100

set background=dark
colorscheme tombat
if has("gui_running")
  set go-=T
  set guifont=M+_1mn_light_for_Powerline:h13
  set noballooneval
else
  set mouse=a
endif

highlight clear SignColumn
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufRead,BufNewFile *.mml set syntax=javascript
autocmd BufRead,BufNewFile *.bones set syntax=javascript
autocmd BufRead,BufNewFile *.result set syntax=xml
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufNewFile,BufRead *._ set filetype=html
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Show syntax highlighting groups for word under cursor
nmap <C-S-A> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! LightMode()
  colorscheme habiLight
  set guifont=Monaco:h13
endfunc

""" FocusMode
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set columns=80
    set noruler
    set nonumber
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
    set number
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    execute 'colorscheme ' . g:colors_name
  endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>

let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.pyc$', 'CVS', '\~$']
let NERDTreeHijackNetrw=1

let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes = ['cpp']
let g:syntastic_javascript_checkers = ['jshint']

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

let g:ackprg = 'ag --nogroup --nocolor --column'

inoremap <expr><TAB>  pumvisible() ? "<C-n>" : "<TAB>"
map <leader>gu :GundoToggle<CR>
" map <c-l> :CtrlPLine<CR>
" map <c-k> :CtrlPBuffer<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

set shell=/bin/bash

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <C-p> :<C-u>Unite -buffer-name=files   -start-insert file<cr>
nnoremap <C-t> :<C-u>Unite -buffer-name=files   -start-insert file_rec/async<cr>
nnoremap <C-y> :<C-u>Unite -buffer-name=yank    history/yank<cr>
nnoremap <C-l> :<C-u>Unite -buffer-name=search    grep:.<cr>

" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
