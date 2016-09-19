silent! call pathogen#infect()

syntax on
filetype plugin indent on

" Keybindings
nnoremap <C-k> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap <Leader>f :Neomake flow<CR>
nmap <leader>a :Ack 

set clipboard+=unnamed
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
set splitright
set laststatus=2
set ttimeoutlen=0

" Appearance
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $PATH .= ':node_modules/.bin/'
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox
set statusline=%f%{fugitive#statusline()}

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0
set completeopt-=preview
" == mxw/vim-jsx ==
let g:jsx_ext_required = 0

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

" Configure Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

inoremap <expr><TAB>  pumvisible() ? "<C-n>" : "<TAB>"
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

set shell=/usr/local/bin/zsh

" never engage ex mode
" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>
