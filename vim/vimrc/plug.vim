"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   1 Vim-PLug core
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "c"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins to install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree - sidebar file browser
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

" GIT - fugitive for commands,
"     - gitgutter for marking changed lines
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Intleligent (un)commenting code
Plug 'tpope/vim-commentary'

" Pretty bars
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" removing trailing whitespaces
Plug 'bronson/vim-trailing-whitespace'

" Sidebar with list of classes/functions/variables
Plug 'majutsushi/tagbar'

" Makes solorscheme work better with terminal
Plug 'vim-scripts/CSApprox'

" Shows vertical lines for indents
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/grep.vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'avelino/vim-bootstrap-updater'
Plug 'sheerun/vim-polyglot'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

if v:version >= 703
  Plug 'Shougo/vimshell.vim'
endif

if v:version >= 704
  "" Snippets
  Plug 'SirVer/ultisnips'
endif

Plug 'honza/vim-snippets'

"" Color
Plug 'tomasr/molokai'

"" Startify
Plug 'mhinz/vim-startify'

"QFEnter allows you to open a Quickfix item in a window you choose
Plug 'yssl/QFEnter'

"" Fancy marks display and toggle
Plug 'kshenoy/vim-signature'

"" Precesion colors for machines and people
Plug 'altercation/vim-colors-solarized'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}

" Shows manpage in split window
Plug 'ludwig/split-manpage.vim'

" YouCompleteMe
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Gutentags
Plug 'ludovicchabant/vim-gutentags'

" A.vim
Plug 'vim-scripts/a.vim'

" Mark.vim
Plug 'Tuxdude/mark.vim'

" BufOnly - delete buffers except the current one
Plug 'vim-scripts/BufOnly.vim'

"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call plug#end()

" Required:
filetype plugin indent on


