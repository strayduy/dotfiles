" Set the shell
set shell=/bin/zsh

" Syntax highlighting
syntax on

" Escape insert mode with jj
:inoremap jj <Esc>

" Move cursor by line naturally with k and j in navigation mode.
nnoremap j gj
nnoremap k gk

" Clear search highlight with Enter
nnoremap <CR> :noh<CR><CR>

" Control + Direction to change tabs
noremap <C-l> gt
noremap <C-h> gT

" Highlight search terms
set hlsearch

" Show absolute number for current line, relative numbers for other lines
set relativenumber
set nu rnu

" Map <Leader> to spacebar
let mapleader=" "

" Save the current buffer using the leader key
noremap <Leader>s :w<CR>

" Enables 24-bit RGB color
set termguicolors

" Indentation settings -- unless otherwise specified by a filetype, use 4-space tab and expanded tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set expandtab

" Filetype-specific indentation
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType stylus setlocal shiftwidth=2 tabstop=2

" For times when I hold down the shift key
:command WQ wq
:command Wq wq
:command W w
:command Q q
:command QA qa
:command Qa qa

" Centralized swap and backup directories
set dir=~/.vim/swap//
set backupdir=~/.vim/backup//

" Plugins via vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ctrlpvim/ctrlp.vim'           " Fuzzy file finding
Plug 'vim-airline/vim-airline'      " Status line
Plug 'easymotion/vim-easymotion'    " Navigation in normal mode
Plug 'airblade/vim-gitgutter'       " Git diff in gutter
Plug 'tpope/vim-commentary'         " Comment out lines and blocks
Plug 'joshdick/onedark.vim'         " Theme
Plug 'othree/yajs.vim'              " Syntax highlighting: Javascript
Plug 'HerringtonDarkholme/yats.vim' " Syntax highlighting: Typescript
Plug 'maxmellon/vim-jsx-pretty'     " Syntax highlighting: JSX
Plug 'dense-analysis/ale'           " Linting
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion
Plug 'SirVer/ultisnips'             " Snippets
call plug#end()

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" CtrlP - Open buffers in new tab by default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" CtrlP - Don't index certain directories and file types
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|bower_components)$',
  \ 'file': '\v\.(exe|so|dll|pyc|woff|woff2|png)$',
  \ }

" Airline - Show linting errors
let g:airline#extensions#ale#enabled = 1

" ALE
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\ 'typescriptreact': ['eslint']
\}
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\ 'typescript': ['prettier', 'eslint'],
\ 'typescriptreact': ['prettier', 'eslint'],
\ 'scss': ['prettier'],
\}

" ALE - Only run linters named in ale_linters settings
let g:ale_linters_explicit = 1

let g:ale_exclude_highlights = []

" ALE - Shortcut for fixing lint errors
nnoremap <Leader>f :ALEFix<CR>

" Deoplete
let g:python3_host_prog = expand('~/.venvs/py3nvim/bin/python')
"let g:deoplete#enable_at_startup = 1

" Deoplete - For autocompletion, ignore case unless the input contains an
" uppercase letter
call deoplete#custom#option('smart_case', v:true)

" For autocompletion, map Tab and Shift+Tab to cycle through options
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" CoC
let g:coc_global_extensions = ['coc-tsserver']

" UltiSnips
let g:UltiSnipsExpandTrigger="<Leader>x"

" Set theme
colorscheme onedark

" Force background to be black and normal text to be green
highlight Normal guibg=black guifg=green3
