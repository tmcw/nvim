silent! call pathogen#infect()

syntax enable

filetype plugin indent on

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

map <C-s> :w<CR>  "Works in normal mode, must press Esc first"
nnoremap <C-k> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-p> :FZF<CR>

nnoremap <silent> ,rt :call neoterm#test#run('all')<cr>
let g:neoterm_keep_term_open = 1
let g:neoterm_run_tests_bg = 1
let g:neoterm_raise_when_tests_fail = 1

set vb
set number
set ttyfast
set nocompatible
set showmatch
set ruler
set nowrap
set noincsearch
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
set laststatus=2

set background=dark
" colorscheme base16-chalk
if has("gui_running")
  set go-=T
  set guifont=M+_1m_light:h14
  set noballooneval
  colorscheme OceanicNext
else
  colorscheme OceanicNext
  set mouse=a
endif

set background=dark

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

nnoremap <leader>q :set nonumber!<CR>


set statusline=%f%{fugitive#statusline()}

nmap <leader>a :Ack 
nmap <leader>c :Gcommit --amend<Cr>
nmap <leader>p :! git push<Cr>

" never engage ex mode
" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>
" unhighlight search with \/
" http://www.bestofvim.com/tip/switch-off-current-search/
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" http://stackoverflow.com/questions/676600/vim-search-and-replace-selected-text
" search and replace visually highlighted text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
