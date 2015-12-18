set encoding=utf-8

silent! call pathogen#infect()

filetype plugin indent on

" Keybindings
nnoremap <C-k> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wa<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nmap <leader>a :Ack 

set vb
set number
set showmatch
set ruler
set noincsearch
set nowrap
set hlsearch
" performance: don't highlight beyond 400 columns
set synmaxcol=400
" style: show the 81th line
set colorcolumn=81
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
set ttimeoutlen=0

" Appearance
syntax on
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme hybrid
set statusline=%f%{fugitive#statusline()}

set mouse=a

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown

autocmd! BufWritePost * Neomake
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

autocmd BufWinLeave * call clearmatches()

" Configure Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

" configure vim-jsx
let g:jsx_ext_required = 0

" Configure Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

inoremap <expr><TAB>  pumvisible() ? "<C-n>" : "<TAB>"

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

set shell=/usr/local/bin/zsh

" never engage ex mode
" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>
