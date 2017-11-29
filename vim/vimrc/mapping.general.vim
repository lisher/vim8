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

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

