"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Mapping for moving arround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Close all the buffers
map <leader>ba :BufOnly<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Remap VIM 0 to first non-blank character
map 0 ^
