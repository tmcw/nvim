call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'gavocanov/vim-js-indent'
Plug 'mxw/vim-jsx'

" Completion
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'for': ['javascript', 'javascript.jsx'] }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" Searching
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'

" VimScript Utilities
" Used by gist-vim and rust.vim
Plug 'mattn/webapi-vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tikhomirov/vim-glsl'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'benekastah/neomake'
Plug 'tpope/vim-sleuth'
Plug 'easymotion/vim-easymotion'

" Go
Plug 'fatih/vim-go'

" Rust
Plug 'rust-lang/rust.vim'

" Elm
Plug 'ElmCast/elm-vim'

" color schemes
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'juanedi/predawn.vim'
Plug 'cocopon/iceberg.vim'
call plug#end()

" Keybindings
nnoremap <C-k> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <C-l> :FZF<CR> %<Tab>
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
set colorcolumn=81
set wildignore+=node_modules
set splitright
set ttimeoutlen=0

" Appearance
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $PATH .= ':node_modules/.bin/'
set background=dark
set statusline=%f%{fugitive#statusline()}

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0
set completeopt-=preview

" mxw/vim-jsx
let g:jsx_ext_required = 0

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

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

" Elm
let g:elm_format_autosave = 1

inoremap <expr><TAB>  pumvisible() ? "<C-n>" : "<TAB>"
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" When I resize the window, divide tab space evenly
autocmd VimResized * wincmd =

set shell=/usr/local/bin/zsh

" never engage ex mode
" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>

colorscheme seoul256
