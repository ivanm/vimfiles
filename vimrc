"
" Personal vim configuration
" Iván Mayoral
" https://github.com/ivanm/dotfiles
"

" Pathogen 
""""""""""""""""""""""
"let g:pathogen_disabled=["csapprox"]
call pathogen#infect()

" General Preferences
""""""""""""""""""""""
set nocompatible 
set background=dark 
syntax on 
set encoding=utf-8
set ruler
set nowrap 
set ignorecase 
"set autochdir "Dangerous!
set number
"set binary
set showcmd
let mapleader=","
set mouse=a
set switchbuf=usetab
set laststatus=2
let g:Powerline_symbols = 'fancy'

" Set tip when inserting
""""""""""""""""""""""
au InsertEnter * set cursorline
au InsertLeave * set nocursorline 

" NO Folding
""""""""""""""""""""""
set nofoldenable 

" Indentation preferences
""""""""""""""""""""""
filetype plugin indent on 
set smartindent
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
" Comment to use tabs. Uncomment to use spaces
"set expandtab

" Cosmetics
""""""""""""""""""""""
set wildmenu
"set wildmode=longest:list,full
set noerrorbells
set novisualbell
set t_vb=
set hlsearch
set incsearch
"set list "Show tabs?
set showmatch

" No nedded swap files and backups.
""""""""""""""""""""""
set nobackup
set noswapfile
set hidden

" Uncomment to force 256 colors
""""""""""""""""""""""
"Force 256
"set t_Co=256

"////////////////////
" GUI/TERM  configs 
"///////////////////

if &t_Co >= 256 || has('gui_running')  

  " Preferences por TERM
  " You may need CSAproxto load some colorschemes 
  """"""""""""""""""""""
  " colorscheme nightsky
  colorscheme twilight
  " colorscheme ps_color
  " colorscheme jellybeans 
  
  " Preferences por GUI (MacVim & GVim)
  """"""""""""""""""""""
  if has('gui_running')
    colorscheme twilight
    " colorscheme jellybeans
    set lines=60 columns=300
    set sessionoptions+=resize,winpos
    
    " Preferences for MacVim only
    """"""""""""""""""""""
    if has('gui_macvim')
      set clipboard-=unnamed
      "set lines=60 columns=300
      set vb
      set guioptions-=T
      set guioptions-=R
      set guioptions-=L
      set guioptions-=r
      set guioptions-=l
      set transparency=1
      set guifont=Monaco:h10
      set guifont=Inconsolata:h12
    endif

    " Preferences for Gvim only
    """"""""""""""""""""""
    if has('gui_gtk')
      "set lines=70 columns=500
      winpos 335 76 
      set guioptions-=T
      set guioptions-=R
      set guioptions-=L
      set guioptions-=r
      set guioptions-=l
      set gfn=Monospace\ 9
      "set gfn=Inconsolata\ 10
      set gfn=DejaVu\ Sans\ Mono\ 9 
    endif
  endif

endif 

"////////////////////
"  Shortcuts 
"///////////////////

" Press ee to open current dir
""""""""""""""""""""""
:cnoremap ee e <c-r>=expand("%:h")<cr>/

" Copying uses common C-C and C-X shortcuts
""""""""""""""""""""""
set clipboard+=unnamed
set history=500
nnoremap dd "_dd 
nnoremap <C-C> "+Y
vnoremap <C-C> "+y
nnoremap <C-X> "+dd
vnoremap <C-X> "+d
nnoremap <C-V> "+P
inoremap <C-V> <left><C-O>"+p

" Select All
""""""""""""""""""""""
nnoremap <C-A> ggVG

" Duplicate
""""""""""""""""""""""
noremap <C-D> YP 

" Insert tabs wherever you are
"""""""""""""""""""""""
nnoremap <Tab> i<Tab><ESC><right>
nnoremap <S-Tab> <<<left> 
vnoremap <Tab> >gv 
vnoremap <S-Tab> <gv 
inoremap <S-Tab> <C-O><<

" Tabbing shortcuts
"""""""""""""""""""""""
nnoremap <C-T> :tabnew<CR>:e .<CR>
nnoremap <C-B> :tabprev<CR>
nnoremap <C-N> :tabnext<CR>

" Divide shortcuts
"""""""""""""""""""""""
nnoremap <leader><right> :botright vnew .<CR>
nnoremap <leader><left>  :topleft  vnew .<CR>
nnoremap <leader><up> :topleft  new .<CR>
nnoremap <leader><down>  :botright new .<CR>

"Resize shortcuts
"""""""""""""""""""""""
map <silent>> 10<C-W>>
map <silent>< 10<C-W><
map <silent>- 10<C-W>-
map <silent>+ 10<C-W>+
map <silent>= 10<C-W>=

" Moving shortcuts
"""""""""""""""""""""""
"map <Esc>[1;5C <C-right>
"map <Esc>[1;5D <C-left>
"map <Esc>[1;5A <C-up>
"map <Esc>[1;5B <C-down>
nnoremap <C-right> <C-W><right>
nnoremap <C-left>  <C-W><left>
nnoremap <C-up> <C-W><up>
nnoremap <C-down>  <C-W><down>
nnoremap <leader><leader> <C-W><C-W> 

" Saving shortcuts
"""""""""""""""""""""""
nnoremap <C-Q> :q!<CR>
nnoremap <C-S> :w<CR>
inoremap <C-S> <C-O>:w<CR>

" Syntastic
"""""""""""""""""""""""
let g:syntastic_loc_list_height=3
let g:syntastic_auto_loc_list=1

"////////////////////
" Function keys 
"///////////////////

"F1 - Help
"""""""""""""""""""""""

" F2 - Syntastic
"""""""""""""""""""""""
inoremap <F2> <C-N>

" F3 - Indent guides
"""""""""""""""""""""""
let g:indent_guides_guide_size = 2
let g:indent_guides_start_level = 1
nnoremap <silent> <F3> :IndentGuidesToggle<CR>

" F4 - TabMan
"""""""""""""""""""""""
let g:tabman_toggle = '<F4>'

" F5 - TagBar
"""""""""""""""""""""""
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1

nnoremap <silent> <F5> :TagbarToggle<CR>
inoremap <silent> <F5> <C-O>:TagbarToggle<CR>
nnoremap <silent> <S-F5> :TagbarOpenAutoClose<CR>
inoremap <silent> <S-F5> <C-O>:TagbarOpenAutoClose<CR>
let g:tagbar_type_php = { 
	    \ 'kinds' : [
	        \ 'i:interfaces:0',
	        \ 'c:clases:0',
	        \ 'd:constant definitions:0',
	        \ 'f:functions:0',
	        \ 'j:javascript functions:0'
	    \ ]
	\ }

" F6 - Toggle Highlight 
"""""""""""""""""""""""
"nnoremap <silent> <F6> :set nohlsearch<CR>
"nnoremap <silent> <S-F6> :set hlsearch<CR>
"nnoremap <F6> :set nohls<CR>:let @/ = ""<CR>:set hls<CR>
nmap <F6> :set hls! <CR>
" hit '/' highlights then enter search mode
nnoremap / :set hlsearch<CR>/

" F7 Available
"""""""""""""""""""""""
" F8 Available
"""""""""""""""""""""""
" F9 Available
"""""""""""""""""""""""
" F10 Available
"""""""""""""""""""""""
" F11 - Fast Mouse Toggle
"""""""""""""""""""""""
nnoremap <F11> :call ToggleMouse()<CR>
function! ToggleMouse()
if &mouse == 'a'
  set mouse=
  echo "Mouse usage disabled"
else
  set mouse=a
  echo "Mouse usage enabled"
endif
endfunction

" F12 - Fix for pasting
"""""""""""""""""""""""
set pastetoggle=<F12>
