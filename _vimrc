nnoremap <leader>cpp :-1read $HOME/vimsnippets/cppTemplate.txt<CR>7j
 56 nnoremap <leader>m :!make<CR><CR>
 55
 54 " edit + source rc files
 53 nnoremap <leader>ev :vsp $MYVIMRC<CR>
 52 nnoremap <leader>ef :vsp ~/.config/fish/conf.d<CR>
 51 nnoremap <leader>ez :vsp ~/.zshrc<CR>
 50 nnoremap <leader>eb :vsp ~/.bashrc<CR>
 49
 48 nnoremap <leader>rv :source $MYVIMRC<CR>
 47
 46 " apache reload for website
 45 nnoremap <leader>rr :!sudo apache2 restart<CR><CR>
 44
 43 set showmatch " match braces with highlighting
 42 set lazyredraw " faster macros, etc.
 41
 40 set incsearch hlsearch " search char-by-char, highlight matches
 39
 38 " turn off search highlight
 37 nnoremap <leader>/ :nohlsearch<CR>
 36
 35 "yank entire file
 34 nnoremap <leader>y ggVG”+y<esc>
 33
 32 " vim shortcuts
 31 nnoremap ; :
 30 vnoremap ; :
 29 nnoremap <leader>w :wq<cr>
 28 nnoremap <leader>q :q<cr>
 27
 26 " paste last yanked but not deleted text
 25 nmap <leader>p "0p
 24 nmap <leader>P “0P
 23
 22 " surround maps. backtick, quotes
 21 nnoremap <leader>" /\n<cr>Nj0i"<esc>nli"<esc>
 20
 19 " Move current line up and down using j and k
 18 nmap <leader>j mz:m+<cr>`z
 17 vmap <leader>j :m'>+<cr>`<my`>mzgv`yo`z
 16 nmap <leader>k mz:m-2<cr>`z
 15 vmap <leader>k :m'<-2<cr>`>my`<mzgv`yo`z
 14
 13 " pressing * searches for the current word
 12 " Super useful! From an idea by Michael Naumann
 11 vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
 10
  9 " folding
  8 set foldenable foldlevelstart=0 foldnestmax=10 foldmethod=marker
  7
  6 " highlight last inserted text
  5 nnoremap gV `[v`]
  4
  3 "pathogen
  2 execute pathogen#infect()
  1 syntax on
91  filetype plugin indent on
