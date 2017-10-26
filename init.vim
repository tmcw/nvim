call plug#begin('~/.vim/plugged')

Plug 'wakatime/vim-wakatime'
Plug 'justinmk/vim-dirvish'

" Git
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'

" Clojure
" Plug 'venantius/vim-cljfmt'
" Plug 'tpope/vim-fireplace'
" Plug 'guns/vim-clojure-static'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'gavocanov/vim-js-indent'
Plug 'mxw/vim-jsx'
Plug 'sbdchd/neoformat'

" Completion
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }

" Searching
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf'

" VimScript Utilities
" Used by gist-vim and rust.vim
Plug 'mattn/webapi-vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'

" Syntax
Plug 'w0rp/ale'
Plug 'tmcw/vim-eslint-compiler'

" Languages
" Plug 'fatih/vim-go', { 'for': ['go'] }
" Plug 'tikhomirov/vim-glsl'
" Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
" Plug 'ElmCast/elm-vim', { 'for': ['elm'] }
" Plug 'rhysd/vim-wasm'
Plug 'sebastianmarkow/deoplete-rust'

" color schemes
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'juanedi/predawn.vim'
Plug 'cocopon/iceberg.vim'
Plug 'mhinz/vim-janah'
Plug 'noahfrederick/vim-hemisu'
call plug#end()

set nocompatible

" Keybindings
nnoremap <C-k> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>w :update<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>c :ccl<CR>
nnoremap <Leader>Q :qa<CR>
nmap <leader>a :GrepperRg 

" Tern
" let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Flow
let g:flow#enable = 0
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
  let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

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
let $PATH .= ':node_modules/.bin/:/Users/tmcw/.cargo/bin/'
set termguicolors
set background=dark
set statusline=%f%{fugitive#statusline()}
colorscheme janah

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

" pencil colorscheme
let g:pencil_higher_contrast_ui = 1

let g:thematic#themes = {
\ 'pencil_lite' :{ 'colorscheme': 'pencil',
\                  'background': 'light',
\                  'airline-theme': 'light',
\                  'laststatus': 0,
\                  'ruler': 1,
\                },
\ }

set mouse=a

autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.wah set filetype=ast
autocmd BufWinLeave * call clearmatches()

" Disable netrw
let loaded_netrwPlugin = 1
augroup my_dirvish_events
  autocmd FileType dirvish sort r /[^\/]$/
augroup END

" Prettier
function! TogglePrettier()
    if !exists('#PrettierAutoGroup#BufWritePre')
        echo "autoformat on"
        augroup PrettierAutoGroup
            autocmd!
            autocmd BufWritePre *.js Neoformat
        augroup END
    else
        echo "autoformat off"
        augroup PrettierAutoGroup
            autocmd!
        augroup END
    endif
endfunction

nnoremap <leader>f :call TogglePrettier()<CR>

let g:deoplete#sources#rust#racer_binary='/Users/tmcw/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/tmcw/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust'

" function! neoformat#formatters#javascript#prettier() abort
"     return {
"         \ 'exe': './node_modules/.bin/prettier',
"         \ 'args': ['--stdin', '--single-quote'],
"         \ 'stdin': 1,
"         \ }
" endfunction

let g:neoformat_only_msg_on_error = 1

" Configure Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

" Elm
let g:elm_format_autosave = 1

inoremap <expr><TAB>  pumvisible() ? "<C-n>" : "<TAB>"
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

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

" never engage ex mode
" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>
