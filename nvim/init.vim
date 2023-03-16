"
" Personal vim configuration
" Iván Mayoral
"
call plug#begin('~/.vim/bundle')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Plugins
""""""""""""""""""""""
" visual
Plug 'godlygeek/csapprox'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'blueyed/vim-diminactive'
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" enhancements
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-expand-region'
Plug 'tomtom/tcomment_vim'
Plug 'tmhedberg/matchit'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'andweeb/presence.nvim'
" webdev
Plug 'shawncplus/phpcomplete.vim'
Plug 'beyondwords/vim-twig'
Plug 'lukaszb/vim-web-indent'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tomlion/vim-solidity'
Plug 'sohkai/syntastic-local-solhint'
Plug 'posva/vim-vue'
Plug 'w0rp/ale'
Plug 'scrooloose/syntastic'
if has("python3")
  Plug 'vim-vdebug/vdebug'
endif

" SuperTab/Deoplete
""""""""""""""""""""""
if has("python3")
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
else
  Plug 'ervandew/supertab'
endif

call plug#end()

" General Preferences
""""""""""""""""""""""
filetype plugin indent on
syntax on
let mapleader=" "
set encoding=utf-8
set ruler
set nowrap
set ignorecase
set number
set showcmd
set mouse=a
set switchbuf=usetab
set laststatus=2
set completeopt=menu,preview,noinsert
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
set timeout timeoutlen=400 ttimeoutlen=0
set swapfile
set dir=~/.swap-files

" Indentation
""""""""""""""""""""""
set tabstop=2
set shiftwidth=2
" Comment to use tabs. Uncomment to use spaces
set expandtab

" Theme
""""""""""""""""""""""
set background=dark
" set termguicolors
let g:quantum_black=1
let g:airline_theme='quantum'
colorscheme quantum

" Cursor change on mode
""""""""""""""""""""""
if !has('nvim')
  let &t_SI = "\<esc>[5 q"
  let &t_EI = "\<esc>[2 q"
  let &t_SR = "\<esc>[3 q"
endif

" Set tip when inserting
""""""""""""""""""""""
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

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
nnoremap <C-T> :tabe .<CR>gg
noremap <C-K> :tabprev<CR>
noremap <C-J> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>
noremap <C-Tab> :tabnext<CR>
nnoremap <C-Q> :q!<CR>

" Moving shortcuts
"""""""""""""""""""""""
map <Esc>[1;5C <C-right>
map <Esc>[1;5D <C-left>
map <Esc>[1;5A <C-up>
map <Esc>[1;5B <C-down>
nnoremap <C-right> <C-W><right>
nnoremap <C-left> <C-W><left>
nnoremap <C-up> <C-W><up>
nnoremap <C-down> <C-W><down>

" Stupid finger fix
"""""""""""""""""""""""
nnoremap ; :

" Leader Keys
"""""""""""""""""""""""
" Select All
nnoremap <leader>a ggVG
" Divide shortcuts
nnoremap <leader><right> :rightbelow vnew .<CR>gg
nnoremap <leader><left>  :leftabove  vnew .<CR>gg
nnoremap <leader><up> :leftabove  new .<CR>gg
nnoremap <leader><down>  :rightbelow new .<CR>gg
nnoremap <leader><leader><right> :rightbelow vnew %:p:h<CR>gg
nnoremap <leader><leader><left>  :leftabove  vnew %:p:h<CR>gg
nnoremap <leader><leader><up> :leftabove  new %:p:h<CR>gg
nnoremap <leader><leader><down>  :rightbelow new %:p:h<CR>gg
nnoremap <leader>e :e .<CR>gg
nnoremap <leader><leader>e :e %:p:h<CR>gg
nnoremap <leader>t :tabe .<CR>gg
nnoremap <leader><leader>t :tabe %:p:h<CR>gg
"Faster quit
nnoremap <leader>q :q!<CR>
" Switch Tabs
noremap <leader>k :tabprev<CR>
noremap <leader>j :tabnext<CR>
" Switch Pane
nnoremap <leader><CR> <C-W><C-W>
" Beautify
nmap <leader>f :ALEFix<CR>
" Vimwiki
nmap <leader>wk <Plug>VimwikiDiaryPrevDay
nmap <leader>wj <Plug>VimwikiDiaryNextDay

" Plugin Presence
"""""""""""""""""""""""
let g:presence_show_time = 0
let g:presence_editing_text = "Editing files"
let g:presence_file_explorer_text = "Browsing"
let g:presence_git_commit_text = "Committing changes"
let g:presence_plugin_manager_text = "Managing plugins"
let g:presence_reading_text = "Reading files"
let g:presence_workspace_text = "Working on a project"
let g:presence_neovim_image_text   = "Neovim"

" Plugin FZF
"""""""""""""""""""""""
nnoremap <C-P> :P<CR>
vnoremap <C-P> y:Rg <C-r>=fnameescape(@")<CR><CR>

" :F - fzf
command! -bang -nargs=? -complete=dir P
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" :Rg - ripgrep 
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg -i --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" :Rga - ripgrep - all
command! -bang -nargs=* Rga
  \ call fzf#vim#grep(
  \   'rg -i --column --line-number --no-heading --color=always --hidden --no-ignore '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" :Ack - ack
command! -bang -nargs=* Ack
  \ call fzf#vim#grep(
  \   'ack --nogroup --column --color '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" :Ag - grep
" command! -bang -nargs=* Grep
"   \ call fzf#vim#grep(
"   \   'grep --color -i -n -r '.shellescape(<q-args>), 1,
"   \   fzf#vim#with_preview(), <bang>0)

" :Ag - ag
" command! -bang -nargs=* Ag
"   \ call fzf#vim#grep(
"   \   'ag --nogroup --column --color '.shellescape(<q-args>), 1,
"   \   fzf#vim#with_preview(), <bang>0)

" Plugin Netrw
"""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_mousemaps= 0
let g:netrw_fastbrowse = 0
" Double click only on netrw
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
function! NetrwMapping()
  nmap <buffer> <2-leftmouse> <CR>
  nmap <buffer> u -<ESC>
endfunction

" Plugin ALE
"""""""""""""""""""""""
let g:ale_linters = { 
  \'javascript': ['eslint', 'flow-language-server'],
  \'json': [''],
  \'typescript': ['eslint'],
  \'typescriptreact': ['eslint'],
  \'vue': ['eslint'],
  \'solidity': ['solc','solhint']
  \}

let g:ale_fixers = { 
  \'javascript': ['eslint', 'prettier'],
  \'json': ['prettier'],
  \'typescript': ['eslint', 'prettier'],
  \'typescriptreact': ['eslint', 'prettier'],
  \'vue': ['eslint', 'prettier'],
  \'solidity': ['prettier']
  \}

" let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_solidity_solc_executable = 'soljs'

" Plugin - Airline
""""""""""""""""""""""
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

" Plugin - Deoplete
"""""""""""""""""""""""
if has("python3")
  let g:deoplete#enable_at_startup = 1

  inoremap <silent><expr> <S-TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#manual_complete()
  function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}

  inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "\<CR>"
  inoremap <expr><TAB>  pumvisible() ? "\<down>" : "\<TAB>"

  call deoplete#custom#option({
        \ 'auto_complete': v:false,
        \ 'smart_case': v:true,
        \ })

else
  let g:SuperTabDefaultCompletionType = "context"
  let g:SuperTabMappingForward ="<s-tab>"
  let g:SuperTabMappingBackward = "<s-c-tab>"
  inoremap <Nul> <C-X><C-O>
  inoremap <C-Space> <C-X><C-O>
endif
