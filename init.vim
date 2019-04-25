call plug#begin('~/.vim/plugged')

Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-vinegar'

" Git
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'

" JavaScript
Plug 'gavocanov/vim-js-indent'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'hail2u/vim-css3-syntax'

" Searching
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" VimScript Utilities
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'

" color schemes
Plug 'chriskempson/base16-vim'
Plug 'cocopon/iceberg.vim'
Plug 'rakr/vim-one'
Plug 'junegunn/seoul256.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'atelierbram/Base2Tone-vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'robertmeta/nofrils'
Plug 'Lokaltog/vim-monotone'
Plug 'w0rp/ale'

call plug#end()


" modernity
set mouse=a
set shortmess=I
set shiftwidth=2
set visualbell
set noerrorbells
set number
set noincsearch
set synmaxcol=400                   " performance: don't highlight beyond 400 columns
set colorcolumn=81                  " style: show the 81th line
set nowrap                          " never wrap text
set nobackup
set noswapfile
set wildignore+=node_modules
set splitright
set termguicolors
set statusline=%f\ \ %{fugitive#head()}
set background=dark
set shell=/usr/local/bin/zsh

colorscheme two-firewatch

" vim-javascript
" let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_flow = 1

" Disable netrw
let loaded_netrwPlugin = 1
augroup my_dirvish_events
  autocmd FileType dirvish sort r /[^\/]$/
augroup END

let g:grepper = {}
let g:grepper.tools = ['rg']
let g:grepper.simple_prompt = 1
let g:grepper.quickfix = 1
let g:grepper.highlight = 1
let g:ale_lint_on_text_changed = 'never' " only lint files when i save
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

autocmd BufWinLeave * call clearmatches()
autocmd BufReadPost quickfix noremap <silent> <buffer> o  <CR>
autocmd BufReadPost quickfix noremap <silent> <buffer> t  <C-w><CR><C-w>T
autocmd BufReadPost quickfix noremap <silent> <buffer> T  <C-w><CR><C-w>TgT<C-W><C-W>
autocmd BufReadPost quickfix noremap <silent> <buffer> v  <C-w><CR><C-w>H<C-W>b<C-W>J<C-W>t

" Mappings
nnoremap <C-k> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-l> <C-w><C-w>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>w :update<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>c :ccl<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap Q <nop>
nmap <leader>a :GrepperRg 
" toggle prettier
nnoremap <Leader>f :let g:ale_fix_on_save = !g:ale_fix_on_save<CR>
