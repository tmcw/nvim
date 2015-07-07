silent! call pathogen#infect()

set t_Co=256
syntax enable

filetype plugin indent on

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
set wildignore+=node_modules
set backupdir=/Users/tmcw/tmp/
set directory=/Users/tmcw/tmp/
set nobackup
set nowritebackup
set splitright

" help gf work with node
set suffixesadd+=.js

set laststatus=2
set timeout timeoutlen=1000 ttimeoutlen=100

set background=dark
" colorscheme base16-chalk
if has("gui_running")
  set go-=T
  set guifont=M+_1m_light:h14
  set noballooneval
  colorscheme base16-chalk
else
  colorscheme desert256
  set mouse=a
endif

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.gradle set filetype=groovy
autocmd BufNewFile,BufRead *._ set filetype=html
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! LightMode()
  colorscheme habiLight
  set guifont=Monaco:h13
endfunc

let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes = ['cpp', 'html']
let g:syntastic_javascript_checkers = ['eslint']

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

inoremap <expr><TAB>  pumvisible() ? "<C-n>" : "<TAB>"

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

set shell=/usr/local/bin/zsh

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:ctrlp_extensions = ['line', 'funky', 'csearch']
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_max_files = 0
nnoremap <C-f> :CtrlPFunky<Cr>
nnoremap <leader>q :set nonumber!<CR>


set statusline=%f%{fugitive#statusline()}

nmap <leader>a :Ack 
nmap <leader>c :Gcommit --amend<Cr>

let g:yankstack_map_keys = 0
nmap <C-i> <Plug>yankstack_substitute_older_paste
nmap <C-I> <Plug>yankstack_substitute_newer_paste

" never engage ex mode
" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>
" unhighlight search with \/
" http://www.bestofvim.com/tip/switch-off-current-search/
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" \d to TernDef
nnoremap <silent> <Leader>d :TernDef<CR>

" http://stackoverflow.com/questions/676600/vim-search-and-replace-selected-text
" search and replace visually highlighted text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>t :tabnew<CR>


