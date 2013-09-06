"
" Personal vim configuration
" Iván Mayoral
" https://github.com/ivanm/dotfiles
"
" Pathogen 
""""""""""""""""""""""
let g:pathogen_disabled=["csapprox"]
call pathogen#infect()

" General Preferences
""""""""""""""""""""""
filetype plugin indent on 
set nocompatible 
set background=dark 
syntax on 
set encoding=utf-8
set ruler
set nowrap 
set ignorecase 
set number
set showcmd
let mapleader=","
set mouse=a
set switchbuf=usetab
set laststatus=2
nnoremap - :
set completeopt=menu,preview

"Airline settings
""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" SuperTab settings
""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward ="<s-tab>"
let g:SuperTabMappingBackward = "<s-c-tab>"

inoremap <Nul> <C-X><C-O>
inoremap <C-Space> <C-X><C-O>

" NERDTree Settings
""""""""""""""""""""""
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.svn$', '\~$', '.DS_Store']
" let NERDTreeHijackNetrw = 0
let NERDTreeMinimalUI=1
let NERDTreeChDirMode = 2
let g:NERDTreeMapJumpPrevSibling = ''
let g:NERDTreeMapJumpNextSibling = ''
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0
let g:netrw_banner = 0

"CtrlP Settings
""""""""""""""""""""""
let g:ctrlp_working_path_mode = ''
let g:ctrlp_dont_split = 'nerdtree'

"Expand Region
""""""""""""""""""""""
map m <Plug>(expand_region_expand)
map M <Plug>(expand_region_shrink)

" Set tip when inserting
""""""""""""""""""""""
au InsertEnter * set cursorline
au InsertLeave * set nocursorline 

" NO Folding
""""""""""""""""""""""
set nofoldenable 

" Indentation preferences
""""""""""""""""""""""
set smartindent
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
" Comment to use tabs. Uncomment to use spaces
set expandtab

" Cosmetics
""""""""""""""""""""""
set wildmenu
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

" Avoid Closing preview buffer
""""""""""""""""""""""
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"////////////////////
" GUI/TERM  configs 
"///////////////////

if &t_Co >= 256 || has('gui_running')  

  " Preferences for TERM
  " You may need CSAproxto load some colorschemes 
  """"""""""""""""""""""
	" colorscheme wombat256
  " colorscheme nightsky
	" colorscheme twilight
  " colorscheme ps_color
  colorscheme jellybeans 
  " colorscheme distinguished
  " colorscheme hybrid
	" colorscheme t256
  set timeout timeoutlen=1000 ttimeoutlen=100
  
  " Preferences por GUI (MacVim & GVim)
  """"""""""""""""""""""
  if has('gui_running')
   	" colorscheme twilight
    colorscheme jellybeans
    " colorscheme distinguished
		" colorscheme chance-of-storm
    " colorscheme hybrid 
    " colorscheme wombat2 
    set lines=60 columns=300
    set sessionoptions+=resize,winpos
    
    " Preferences for MacVim only
    """"""""""""""""""""""
    if has('gui_macvim')
		  let macvim_skip_cmd_opt_movement = 1
      set clipboard=unnamed
      "set lines=60 columns=300
      set vb
      set guioptions-=T
      set guioptions+=R
      set guioptions-=L
      set guioptions+=r
      set guioptions-=l
      set guioptions-=b
      set guioptions-=h
      set guifont=Source\ Code\ Pro\ for\ Powerline:h11
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
      " set gfn=Monospace\ 9
      "set gfn=Inconsolata\ 10
      set gfn=DejaVu\ Sans\ Mono\ 9 
    endif
  endif

endif 

"////////////////////
"  Shortcuts 
"///////////////////

nnoremap <S-A> <C-A>
nnoremap <S-X> <C-X>

" Press ee to open current dir
""""""""""""""""""""""
:cnoremap ee e <c-r>=expand("%:h")<cr>/

" Copying uses common C-C and C-X shortcuts
""""""""""""""""""""""
set clipboard=unnamed
set history=500
nnoremap dd "_dd
nnoremap d "_d
vnoremap <Del> "_d
nnoremap <Del> "_x
vnoremap x "_x
nnoremap x "_x
nnoremap <C-C> "+Y
vnoremap <C-C> "+y
nnoremap <C-X> "+dd
vnoremap <C-X> "+d
nnoremap <C-V> "+P
inoremap <C-V> <left><C-O>"+p

" Select All
""""""""""""""""""""""
nnoremap <leader>a ggVG

" Duplicate
""""""""""""""""""""""
noremap <C-D> YP 

" Comment
""""""""""""""""""""""
nnoremap <silent> <C-L> :TComment<CR>
vnoremap <C-L> :TComment<CR>
inoremap <C-L> <C-O>:TComment<CR>

" Insert tabs wherever you are
"""""""""""""""""""""""
nnoremap <Tab> i<Tab><ESC><right>
nnoremap <S-Tab> <<<left> 
vnoremap <Tab> >gv 
vnoremap <S-Tab> <gv 

" Tabbing shortcuts
"""""""""""""""""""""""
nnoremap <C-T> :tabnew<CR>:e .<CR>
noremap <C-K> :tabprev<CR>
noremap <C-J> :tabnext<CR>

" Divide shortcuts
"""""""""""""""""""""""
nnoremap <leader><right> :rightbelow vnew .<CR><CR>
nnoremap <leader><left>  :leftabove  vnew .<CR>
nnoremap <leader><up> :leftabove  new .<CR>
nnoremap <leader><down>  :rightbelow new .<CR>

nnoremap <leader><leader><right> :rightbelow vnew %:h<CR><CR>
nnoremap <leader><leader><left>  :leftabove  vnew %:h<CR>
nnoremap <leader><leader><up> :leftabove  new %:h<CR>
nnoremap <leader><leader><down>  :rightbelow new %:h<CR>
nnoremap <leader><leader>t  :tabnew %:h<CR>

" Explore
"""""""""""""""""""""""
nnoremap <leader>e :e %:h<CR>
nnoremap <leader>d :NERDTreeFocus<CR>

"Resize shortcuts
"""""""""""""""""""""""
map <leader>+ 10<C-W>>
map <leader>- 10<C-W><

" Moving shortcuts
"""""""""""""""""""""""
map <Esc>[1;5C <C-right>
map <Esc>[1;5D <C-left>
map <Esc>[1;5A <C-up>
map <Esc>[1;5B <C-down>
nnoremap <C-right> <C-W><right>
nnoremap <C-left>  <C-W><left>
nnoremap <C-up> <C-W><up>
nnoremap <C-down>  <C-W><down>
"nnoremap <leader><leader> <C-W><C-W> 

" Saving shortcuts
"""""""""""""""""""""""
nnoremap <C-Q> :q!<CR>
nnoremap <C-S> :w<CR>
inoremap <C-S> <C-O>:w<CR>

" HTML Helpers
"""""""""""""""""""""""
nnoremap <leader>f vat 

" Syntastic
"""""""""""""""""""""""
let g:syntastic_loc_list_height=3
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map={ 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['html'] }

"////////////////////
" Function keys 
"///////////////////

"F1 - Help
"""""""""""""""""""""""

" F2 -  NERDTreeToggle
"""""""""""""""""""""""
" nnoremap <silent> <F2> :NERDTreeTabsToggle<CR>
" inoremap <silent> <F2> <C-O>:NERDTreeTabsToggle<CR>
nnoremap <silent> <F2> :NERDTreeTabsToggle<CR>
inoremap <silent> <F2> <C-O>:NERDTreeTabsToggle<CR>

" F3 - TabMan
"""""""""""""""""""""""
let g:tabman_toggle = '<F3>'

" F4 - Indent guides
"""""""""""""""""""""""
let g:indent_guides_guide_size = 2
let g:indent_guides_start_level = 1
nnoremap <silent> <F4> :IndentGuidesToggle<CR>

" F5 - TagBar
"""""""""""""""""""""""
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1

nnoremap <silent> <F5> :TagbarOpenAutoClose<CR>
inoremap <silent> <F5> <C-O>:TagbarOpenAutoClose<CR>
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
