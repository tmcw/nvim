silent! call pathogen#infect()

syntax on
filetype plugin indent on

" Keybindings
nnoremap <C-k> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wa<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap <Leader>f :Neomake flow<CR>
nmap <leader>a :Ack 

set shiftwidth=2
set visualbell
set noerrorbells
set number
set noincsearch
set nowrap
set hlsearch
" performance: don't highlight beyond 400 columns
set synmaxcol=400
" style: show the 81th line
set ruler
set colorcolumn=81
set wildignore+=node_modules
set nobackup
set nowritebackup
set splitright
set laststatus=2
set ttimeoutlen=0

" Appearance
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $PATH .= ':node_modules/.bin/'
set background=dark
colorscheme hybrid
set statusline=%f%{fugitive#statusline()}

set mouse=a

autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown

autocmd! BufWritePost * Neomake

autocmd BufWinLeave * call clearmatches()

let g:neomake_error_sign = {
    \ 'text': '✖',
    \ 'texthl': 'ErrorMsg',
    \ }

let g:neomake_warning_sign = {
  \ 'text': '✹',
  \ 'texthl': 'ErrorMsg',
  \ }

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
