"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Settings for misc plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CSApprox - makes gui colorschemes work in terminal
if !has("gui_running")
  let g:CSApprox_loaded = 1
endif

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" tagbar
let g:tagbar_autofocus = 1
"let g:tagbar_ctags_bin = "~/app/ex_ctags/bin/ctags"
let g:tagbar_ctags_bin = "/usr/bin/ctags"

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>

let Grep_Default_Options = '-IR'
let Grep_Default_Filelist='*.cc *.cpp *.hh *.h *.hpp *.sig'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git obj'

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" terminal emulation
if g:vim_bootstrap_editor == 'nvim'
  nnoremap <silent> <leader>sh :terminal<CR>
else
  nnoremap <silent> <leader>sh :VimShellCreate<CR>
endif

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Add to a.vim additional extensions
let g:alternateExtensions_{'cc'} = "hh"
let g:alternateExtensions_{'hh'} = "cc"
" Do not switch to 'cc', 'hh' file if those not exist
let g:alternateNoDefaultAlternate = 1 
