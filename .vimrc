let mapleader=","

set splitright
set splitbelow
set cursorline

" aesthetics
if $TERM_PROGRAM == "Apple_Terminal"
  colorscheme koehler
else
  set termguicolors
  colorscheme catppuccin_mocha
endif

syntax enable
set number
set relativenumber
filetype indent on

let g:netrw_banner=0 "disable banner
let g:netrw_liststyle=3 "tree view
" vimdow navigation
noremap <C-k> <C-w><Up>
noremap <C-j> <C-w><Down>
noremap <C-h> <C-w><Left>
noremap <C-l> <C-w><Right>
inoremap lkj <esc>

set encoding=utf-8
set path+=**
set wildmenu

" tab = 4 spaces. 80 char line max.
set expandtab tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 autoindent
"to basically keymap a macro:
"nnoremap [trigger] :-1read $HOME/.vim/... <CR>
"will read the file and yank the contents into cursor pos
nnoremap <leader>cpp :-1read $HOME/vimsnippets/cppTemplate.txt<CR>7j
nnoremap <leader>m :!make<CR><CR>

" edit + source rc files
nnoremap <leader>vv :vsp $MYVIMRC<CR>
nnoremap <leader>vz :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>sz :source ~/.zshrc<CR>

" apache reload for website
nnoremap <leader>rr :!sudo apache2 restart<CR><CR>

set showmatch " match braces with highlighting
set lazyredraw " faster macros, etc.

set incsearch hlsearch " search char-by-char, highlight matches

" turn off search highlight
nnoremap <leader>/ :nohlsearch<CR>

"yank entire file
nnoremap <leader>y ggVG”+y<esc>

"delete entire file
nnoremap <leader>c ggVGc

" yank to system clipboard
set clipboard=unnamed

" vim shortcuts
nnoremap ; :
vnoremap ; :
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>fq :q!<cr>

" paste last yanked but not deleted text
nmap <leader>p "0p
nmap <leader>P “0P

" surround maps. backtick, quotes
nnoremap <leader>" /\n<cr>Nj0i"<esc>nli"<esc>

" Move current line up and down using j and k
nmap <leader>j mz:m+<cr>`z
vmap <leader>j :m'>+<cr>`<my`>mzgv`yo`z
nmap <leader>k mz:m-2<cr>`z
vmap <leader>k :m'<-2<cr>`>my`<mzgv`yo`z

" pressing * searches for the current word
" Super useful! From an idea by Michael Naumann
"vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

" folding
set foldenable foldlevelstart=0 foldnestmax=10 foldmethod=marker

" highlight last inserted text
nnoremap gV `[v`]

" uncomment below to enable/load plugins
" packloadall
