"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   General mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" NERDTree
nmap <silent><F3> :NERDTreeToggle<CR>
nmap <silent><F2> :MBEToggle<CR><ESC>
nmap <silent><F4> :NERDTreeFocus<CR>>

" Tagbar
nmap <F8> :TagbarToggle<CR><ESC>

"Fast saving
nmap <leader>w :w!<cr>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>

" Temporary changed from ':FZF -m'
" which returns no files
nnoremap <silent> <leader>e :GitFiles<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><A-S-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-S-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

