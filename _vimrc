let mapleader=","
packloadall
set splitright
set splitbelow
set cursorline
colorscheme delek
syntax enable
set number
set relativenumber
filetype indent on
command! MakeTags !ctags -R . 
let g:netrw_banner=0 "disable banner
let g:netrw_browse_split=4 "open in prior window
let g:netrw_altv=1 "open split to the right
let g:netrw_liststyle=3 "tree view
" vimdow navigation
noremap <C-k> <C-w><Up>
noremap <C-j> <C-w><Down>
noremap <C-h> <C-w><Left>
noremap <C-l> <C-w><Right>
inoremap lkj <esc>
set guifont=Courier\ New:h11
"fullscreen, i'm pretty sure
au GUIEnter * simalt ~x
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
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ef :vsp ~/.config/fish/conf.d<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>eb :vsp ~/.bashrc<CR>

nnoremap <leader>rv :source $MYVIMRC<CR>

" apache reload for website 
nnoremap <leader>rr :!sudo apache2 restart<CR><CR>

set showmatch " match braces with highlighting
set lazyredraw " faster macros, etc.

set incsearch hlsearch " search char-by-char, highlight matches

" turn off search highlight
nnoremap <leader>/ :nohlsearch<CR>

"yank entire file
nnoremap <leader>y ggVG”+y<esc>

" vim shortcuts
nnoremap ; :
vnoremap ; :
nnoremap <leader>w :wq<cr>
nnoremap <leader>q :q<cr>

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
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" folding
set foldenable foldlevelstart=0 foldnestmax=10 foldmethod=marker

" highlight last inserted text
nnoremap gV `[v`]

"pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on