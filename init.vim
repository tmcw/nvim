call plug#begin('~/.vim/plugged')

Plug 'justinmk/vim-dirvish'

" Git
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'gavocanov/vim-js-indent'
Plug 'mxw/vim-jsx'
Plug 'sbdchd/neoformat'
Plug 'leafgarland/typescript-vim'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Searching
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf'

" VimScript Utilities
Plug 'mattn/webapi-vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'

" Syntax
Plug 'tmcw/vim-eslint-compiler'

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

Plug 'davidoc/taskpaper.vim'

" Languages
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
" Plug 'w0rp/ale'
" Plug 'fatih/vim-go', { 'for': ['go'] }
" Plug 'tikhomirov/vim-glsl'
" Plug 'ElmCast/elm-vim', { 'for': ['elm'] }
" Plug 'rhysd/vim-wasm'
" Clojure
" Plug 'venantius/vim-cljfmt'
" Plug 'tpope/vim-fireplace'
" Plug 'guns/vim-clojure-static'

call plug#end()

" Use deoplete.
let g:deoplete#enable_at_startup = 1

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

" editing
nnoremap <leader>f :call TogglePrettier()<CR>

" never engage ex mode
" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>

nmap <leader>a :GrepperRg 

autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.wah set filetype=ast
autocmd BufWinLeave * call clearmatches()

" modernity
" use mouse for whatever
set mouse=a

set shiftwidth=2
set visualbell
set noerrorbells
set number
set noincsearch

" performance: don't highlight beyond 400 columns
set synmaxcol=400

" style: show the 81th line
set colorcolumn=81
" never wrap text
set nowrap

" auto-reload updated files
set autoread

" safety: ever backup. I know it's wrong
set nobackup
set noswapfile

set wildmenu
set wildignore+=node_modules
set splitright
set ttimeout
set ttimeoutlen=0

" Appearance
let $PATH .= ':node_modules/.bin/:/Users/tmcw/.cargo/bin/'
set termguicolors
set statusline=%f%{fugitive#statusline()}
set background=dark
colorscheme jellybeans

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" mxw/vim-jsx
let g:jsx_ext_required = 0

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

" Rust -------------------------------------------------------------------------
let g:rustfmt_autosave = 1
let g:deoplete#sources#rust#racer_binary='/Users/tmcw/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/tmcw/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust'

function! neoformat#formatters#javascript#prettier() abort
    return {
        \ 'exe': './node_modules/.bin/prettier',
        \ 'stdin': 1,
        \ }
endfunction

let g:neoformat_only_msg_on_error = 1

" Configure Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

" Elm
" let g:elm_format_autosave = 1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
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

" vim markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['js=javascript']
let g:vim_markdown_frontmatter = 1
