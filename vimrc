"
" Personal vim configuration
" Iván Mayoral
" https://github.com/ivanm/dotfiles
"
" NeoBundle
""""""""""""""""""""""
" if has('vim_starting')
"   set nocompatible
"   set runtimepath+=~/.vim/bundle/neobundle.vim/
" endif
" call neobundle#begin(expand('~/.vim/bundle/'))
" NeoBundleFetch 'Shougo/neobundle.vim'

call plug#begin('~/.vim/bundle')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Repos
""""""""""""""""""""""
Plug 'godlygeek/csapprox'
Plug 'kien/ctrlp.vim'
Plug 'kien/tabman.vim'
Plug 'bling/vim-airline'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tmhedberg/matchit'
Plug 'lukaszb/vim-web-indent'
Plug 'editorconfig/editorconfig-vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'blueyed/vim-diminactive'
Plug 'vimwiki/vimwiki'
Plug 'beyondwords/vim-twig'
Plug 'mxw/vim-jsx'
" Plug 'pangloss/vim-javascript'
if ($SUDO_USER == '' || $USER == $SUDO_USER)
  Plug 'Shougo/unite.vim'
endif

" General Preferences
""""""""""""""""""""""
filetype plugin indent on
syntax on
let mapleader=","
set background=dark
set encoding=utf-8
set ruler
set nowrap
set ignorecase
set number
set showcmd
set mouse=a
set switchbuf=usetab
set laststatus=2
set completeopt=menu,preview
set nofoldenable
set listchars=tab:>-,space:·
set list
set wildmenu
set noeb novb t_vb=
set hlsearch
set incsearch
set showmatch
set smartindent
set backspace=indent,eol,start
set nobackup
set noswapfile
set hidden

"Autocomplete fallbacks
""""""""""""""""""""""
if has("lua")
  Plug 'Shougo/neocomplete.vim'
  " Neocomplete
  """"""""""""""""""""""
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#disable_auto_complete =1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_auto_delimiter = 1

  let g:neocomplete#enable_auto_select = 1
  let g:neocomplete#enable_refresh_always = 1

inoremap <expr><S-TAB>  pumvisible() ? "\<down>" : neocomplete#start_manual_complete()
  inoremap <expr><TAB>  pumvisible() ? "\<down>" : "\<TAB>"
  inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "\<CR>"

  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  " let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

else
  Plug 'ervandew/supertab'
  " Plugin - S  uperTab
  """"""""""" """""""""""
  let g:SuperTabDefaultCompletionType = "context"
  let g:SuperTabMappingForward ="<s-tab>"
  let g:SuperTabMappingBackward = "<s-c-tab>"
  inoremap <Nul> <C-X><C-O>
  inoremap <C-Space> <C-X><C-O>
endif

" Indentation preferences
""""""""""""""""""""""
set tabstop=2
set shiftwidth=2
" Comment to use tabs. Uncomment to use spaces
set expandtab

" Set tip when inserting
""""""""""""""""""""""
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

" Avoid Closing preview buffer
""""""""""""""""""""""
au InsertLeave * if pumvisible() == 0|pclose|endif

" Beautifiers/Uglifiers
""""""""""""""""""""""
vmap <leader>bh :!js-beautify --type html -s 2 -q -f -<CR>
vmap <leader>bj :%!js-beautify --type js -s 2 -q -f -<CR>
vmap <leader>uc :!cleancss -b --skip-import --skip-advanced --skip-rebase<CR>ggVG='.

" X Global Functions
""""""""""""""""""""""
command! Xselect norm! ggVG
command! Xbeautifyhtml norm! ggVG :!js-beautify --type html -s 2 -q -f -<CR>
command! Xbeautifyjs norm! ggVG :!js-beautify --type js -s 2 -q -f -<CR>
command! Xindent norm! ggVG='.
command! Xguides norm! :IndentGuidesToggle<CR>
command! Xmousetoggle norm! :call ToggleMouse()<CR>
command! Xclearsearch norm! :let @/ = ""<CR>

" Plugin Ack
"""""""""""""""""""""""
:ab Ack LAck!
let g:ackprg = 'ag --vimgrep'

" Plugin - Syntastic
"""""""""""""""""""""""
let g:syntastic_php_checkers = ['php']
let g:syntastic_php_phpcs_args = "--standard=PSR2 --encoding=utf-8"
let g:syntastic_loc_list_height = 3
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map={ 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['html'] }
let g:syntastic_javascript_checkers=['eslint']

" Plugin - Airline
""""""""""""""""""""""
" let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#default#layout = [
  \ [ 'a' , 'c'],
  \ [ 'x', 'y', 'z', 'warning']
  \ ]
 
let g:airline#extensions#default#section_truncate_width = {
    \ 'x': 70,
    \ 'y': 70,
    \ 'z': 70,
    \ }

" let g:airline#extensions#default#section_truncate_width = {}


" Plugin - SuperTab
""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward ="<s-tab>"
let g:SuperTabMappingBackward = "<s-c-tab>"
inoremap <Nul> <C-X><C-O>
inoremap <C-Space> <C-X><C-O>

" Plugin - TagBar
"""""""""""""""""""""""
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1
let g:tagbar_type_php = {
      \ 'kinds' : [
          \ 'i:interfaces:0',
          \ 'c:clases:0',
          \ 'd:constant definitions:0',
          \ 'f:functions:0',
          \ 'j:javascript functions:0'
      \ ]
  \ }

" Plugin - NERDTree
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

" Plugin - CtrlP
""""""""""""""""""""""
let g:ctrlp_working_path_mode = ''
let g:ctrlp_dont_split = 'nerdtree'

" Plugin - Indent guides
"""""""""""""""""""""""
let g:indent_guides_guide_size = 2
let g:indent_guides_start_level = 1

" Plugin - Indent
""""""""""""""""""""""
let g:html_indent_inctags="head,body"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

" Plugin - Expand Region
""""""""""""""""""""""
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" Plugin - Vimwiki
""""""""""""""""""""""
nmap <Leader>k <Plug>VimwikiDiaryPrevDay
nmap <Leader>j <Plug>VimwikiDiaryNextDay

" GUI/TERM  configs
""""""""""""""""""""""
if &t_Co >= 256 || has('gui_running')

  " Preferences for TERM
  " You may need CSAproxto load some colorschemes
  """"""""""""""""""""""
  colorscheme jellybeans
  set timeout timeoutlen=1000 ttimeoutlen=100

  "Fixing paste on Xterm
  """"""""""""""""""""""
  if !(has('gui_running'))
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
  endif


  " Preferences por GUI (MacVim & GVim)
  """"""""""""""""""""""
  if has('gui_running')
    colorscheme jellybeans
    set lines=60 columns=300
    set sessionoptions+=resize,winpos

    " Preferences for MacVim only
      """"""""""""""""""""""
    if has('gui_macvim')
      let macvim_skip_cmd_opt_movement = 1
      set clipboard=unnamed
      "set lines=60 columns=300
      set vb
      set guioptions+=bRL
      set guioptions-=T
      set guifont=Source\ Code\ Pro\ for\ Powerline:h10
    endif

    " Preferences for Gvim only
    """"""""""""""""""""""
      if has('gui_gtk')
      "set lines=70 columns=500
      winpos 335 76
      set guioptions-=T
      " set guioptions-=R
      " set guioptions-=L
      " set guioptions-=r
      " set guioptions-=l
      set guioptions+=bRL
      " set gfn=DejaVu\ Sans\ Mono\ 9
      set gfn=Inconsolata\ for\ Powerline\ Medium\ 9
      nnoremap <C-F> :promptrepl<CR>
    endif
  endif

endif

" Preferences for Windows only
""""""""""""""""""""""
if has("win32")
  set guifont=Consolas:h10
  let g:airline_powerline_fonts = 0
  let NERDTreeDirArrows=0
endif

" OSX open
""""""""""""""""""""""
nnoremap <leader>o :!open %<CR>

" Shift Mappings
""""""""""""""""""""""
nnoremap <S-A> <C-A>
nnoremap <S-X> <C-X>

" Press ee to open current dir
""""""""""""""""""""""
:cnoremap eee e <c-r>=expand("%:h")<cr>/

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
" nnoremap <C-V> "+gP
inoremap <C-V> <left><C-O>"+p
vnoremap <BS> "_d


" Select All
""""""""""""""""""""""
nnoremap <leader>a ggVG

" Duplicate
""""""""""""""""""""""
noremap <C-D> "aY"aP

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

" Resize shortcuts
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

" Stupid finger fix
"""""""""""""""""""""""
nnoremap ; :

" Faster switch
"""""""""""""""""""""""
nnoremap <Space> <C-W><C-W>

" Saving shortcuts
"""""""""""""""""""""""
nnoremap <C-Q> :q!<CR>
nnoremap <C-S> :w<CR>
inoremap <C-S> <C-O>:w<CR>

" Hit '/' highlights then enter search mode
"""""""""""""""""""""""
nnoremap / :set hlsearch<CR>/
nnoremap <silent> <leader>/ :let @/ = ""<CR>


" F2 -  NERDTreeToggle
"""""""""""""""""""""""
" nnoremap <silent> <F2> :NERDTreeTabsToggle<CR>
" inoremap <silent> <F2> <C-O>:NERDTreeTabsToggle<CR>
nnoremap <silent> <F2> :NERDTreeTabsToggle<CR>
inoremap <silent> <F2> <C-O>:NERDTreeTabsToggle<CR>

" F3 - TabMan
"""""""""""""""""""""""
let g:tabman_toggle = '<F3>'

" F4 - TagBar
"""""""""""""""""""""""
nnoremap <silent> <F4> :TagbarOpenAutoClose<CR>
inoremap <silent> <F4> <C-O>:TagbarOpenAutoClose<CR>

" Misc
"""""""""""""""""""""""
function! ToggleMouse()
if &mouse == 'a'
  set mouse=
  echo "Mouse usage disabled"
else
  set mouse=a
  echo "Mouse usage enabled"
endif
endfunction

call plug#end()
