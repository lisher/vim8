"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Graphics
"   - colors, fonts, gvim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set colorscheme
colorscheme cpp-def

set background=dark

"Use 256 colors
set t_Co=256

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T       "Remove toolbar
  set guioptions+=e       "Always show tag bar
  set guitablabel=%M\ %t  "Set tab label (modified[+/-], title)

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ 10

if &term =~ '256color'
  set t_ut=
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0

