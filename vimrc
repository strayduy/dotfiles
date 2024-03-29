set nocompatible

" Pathogen
call pathogen#infect()
call pathogen#helptags()
 
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on

" Map <Leader> to spacebar
let mapleader=" "

" Escape insert mode with jj
:imap jj <Esc>

" Nerdtree
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" Auto-close Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Toggle Nerdtree
map <F2> :NERDTreeToggle<CR>

set background=dark
if has('gui_running')
    colorscheme solarized
endif

" Syntax highlighting
syntax on

" Tabs to spaces
set expandtab

" Tab width = 4 spaces
set shiftwidth=4
set tabstop=4

" Except for HTML files, where tab width = 4 spaces
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType stylus setlocal shiftwidth=2 tabstop=2

" Highlight search terms
set hlsearch

" Show relative line numbers
set relativenumber

" Show status bar
set laststatus=2

" Clear search highlight with Enter
nnoremap <CR> :noh<CR><CR>

" Show whitespace characters as other characters
exec "set listchars=tab:\u25B8\\ ,trail:\uB7,nbsp:~"
set list

"Invisible character colors
highlight SpecialKey ctermfg=234 guifg=#1c1c1c

" ALE
let g:ale_linters = {'javascript': ['eslint', 'prettier'], 'typescript': ['eslint', 'prettier']}
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'typescript': ['prettier', 'eslint']}

" Only run linters named in ale_linters settings
let g:ale_linters_explicit = 1

" Show linting errors in airline
let g:airline#extensions#ale#enabled = 1

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Restore cursor position when reopening a file
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

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

" Triggering EasyMotion with just <Leader> instead of <Leader><Leader>
let g:EasyMotion_leader_key = '<Leader>'

" Enabling Rainbow Parentheses by default
au VimEnter *.py RainbowParenthesesToggle
au Syntax *.py RainbowParenthesesLoadRound
au Syntax *.py RainbowParenthesesLoadSquare
au Syntax *.py RainbowParenthesesLoadBraces

" Changing the Rainbow Parentheses color order because I don't like having
" two reddish colors in a row
let g:rbpt_colorpairs = [
    \ ['red',         'firebrick3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ]

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

" Control + Direction to Change Tabs
noremap <C-l> gt
noremap <C-h> gT

" Move cursor by line naturally with k and j in navigation mode.
nnoremap j gj
nnoremap k gk

autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" Enable modelines
set modeline
set modelines=5
