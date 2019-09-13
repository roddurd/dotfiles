colorscheme koehler
command! MakeTags !ctags -R . 
let g:netrw_banner=0 "disable banner
let g:netrw_browse_split=4 "open in prior window
let g:netrw_altv=1 "open split to the right
let g:netrw_liststyle=3 "tree view
syntax enable
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
set number
set relativenumber
inoremap lkj <esc>
set guifont=Courier\ New:h11
"fullscreen, i'm pretty sure
au GUIEnter * simalt ~x
set encoding=utf-8
set path+=**
set wildmenu
set tabstop=4 shiftwidth=4 expandtab
"to basically keymap a macro:
"nnoremap [trigger] :-1read $HOME/.vim/... <CR>
"will read the file and yank the contents into cursor pos
nnoremap ,cpp :-1read $HOME/vimsnippets/cppTemplate.txt<CR>7j
nnoremap ,rc :e! $MYVIMRC<CR>

