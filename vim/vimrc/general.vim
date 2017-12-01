"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable indention
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab
  set stal=2  "Always show the tab labels line
catch
endtry

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"" Use modeline overrides
set modeline
set modelines=10

" set OS window title
set title
set titleold="Terminal"
set titlestring=%F

" Define characters to use for whitespaces
"set listchars=tab:▸\ ,trail:~,eol:$
set listchars=tab:~\ ,trail:~,eol:$

" vsplit right from current buffer
set splitright

"Number line on the left
set number

"Show number line relative to current line
set relativenumber

""""""""""""""""""""""""""""""
"   Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l:%v

" open diff windows in vertical split
set diffopt+=vertical

