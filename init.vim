call plug#begin('~/.vim/plugged')

Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-vinegar'

" Git
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'

" JavaScript
Plug 'gavocanov/vim-js-indent'

" Searching
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" VimScript Utilities
Plug 'mattn/webapi-vim'

Plug 'ervandew/supertab'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'

" color schemes
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'reedes/vim-colors-pencil'
Plug 'rakr/vim-one'
Plug 'juanedi/predawn.vim'
Plug 'cocopon/iceberg.vim'
Plug 'mhinz/vim-janah'
Plug 'noahfrederick/vim-hemisu'

" Languages
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'w0rp/ale'

call plug#end()

nmap <leader>a :GrepperRg 

autocmd BufWinLeave * call clearmatches()

" modernity
set mouse=a
set shiftwidth=2
set visualbell
set noerrorbells
set number
set noincsearch

set synmaxcol=400                   " performance: don't highlight beyond 400 columns
set colorcolumn=81                  " style: show the 81th line
set nowrap                          " never wrap text
" set autoread                        " auto-reload updated files

" safety: never backup. I know it's wrong
set nobackup
set noswapfile

set wildignore+=node_modules
set splitright

" Re-enable if Escape issue recurs
" set ttimeout
" set ttimeoutlen=0

" Appearance
set termguicolors
set statusline=%f%{fugitive#statusline()}
set background=dark
colorscheme jellybeans

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" Disable netrw
let loaded_netrwPlugin = 1
augroup my_dirvish_events
  autocmd FileType dirvish sort r /[^\/]$/
augroup END

" Configure Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

set shell=/usr/local/bin/zsh

let g:grepper = {}
let g:grepper.tools = ['rg']
let g:grepper.simple_prompt = 1
let g:grepper.quickfix = 1
let g:grepper.highlight = 1

autocmd BufReadPost quickfix noremap <silent> <buffer> o  <CR>
autocmd BufReadPost quickfix noremap <silent> <buffer> t  <C-w><CR><C-w>T
autocmd BufReadPost quickfix noremap <silent> <buffer> T  <C-w><CR><C-w>TgT<C-W><C-W>
autocmd BufReadPost quickfix noremap <silent> <buffer> v  <C-w><CR><C-w>H<C-W>b<C-W>J<C-W>t

" only lint files when i save
" let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

" Mappings
" --------
" fast tab moving
nnoremap <C-k> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
" next pane
nnoremap <C-l> <C-w><C-w>
nnoremap <C-p> :FZF<CR>
" saving
nnoremap <Leader>w :update<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>c :ccl<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap Q <nop>
" toggle prettier
nnoremap <Leader>f :let g:ale_fix_on_save = !g:ale_fix_on_save<CR>
" never engage ex mode
