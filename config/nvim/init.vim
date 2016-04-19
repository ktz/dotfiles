if (!isdirectory(expand('~/.config/nvim/repos/github.com/Shougo/dein.vim')))
  call system(expand('mkdir -p ~/.config/nvim/repos/github.com'))
  call system(expand('git clone https://github.com/Shougo/dein.vim ~/.config/nvim/repos/github.com/Shougo/dein.vim'))
endif
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc', {'build': 'make -f make_mac.mak'})
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('sheerun/vim-polyglot')
call dein#add('tyru/caw.vim')
call dein#add('jreybert/vimagit')
call dein#add('airblade/vim-gitgutter')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('tpope/vim-surround')
call dein#add('konfekt/FastFold')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('nanotech/jellybeans.vim')
" call dein#add('ryanoasis/vim-devicons')
if dein#check_install()
  call dein#install()
  let pluginExist=1
endif
call dein#end()
filetype plugin indent on

syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
colorscheme jellybeans
set background=dark
let g:airline_theme='jellybeans'
set clipboard+=unnamedplus
set noswapfile
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set wildmenu
set wildmode=full
set laststatus=2
set number
set smartcase
set wrapscan
set list
set listchars=eol:¬,tab:▸\
set hlsearch
set smartindent
set showcmd
set backspace=indent,eol,start
set autoread
set nobackup
set cursorline
set visualbell t_vb=
hi ZenkakuSpace ctermbg=red guibg=#ff0000
au BufNewFile,BufRead * match ZenkakuSpace /　/
nnoremap Q <nop>
map q <Nop>
map <Esc><Esc> :noh<cr>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" unite {{{
nnoremap [unite] <Nop>
nmap <leader>u [unite]
nnoremap <silent> [unite]f :Unite file<cr>
nnoremap <silent> [unite]y :Unite history/yank<cr>
nnoremap <silent> [unite]b :Unite buffer<cr>
nnoremap <silent> [unite]r :Unite file_mru<cr>
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
" }}}

" vimfiler {{{
nnoremap <leader>f :VimFiler -split -simple -winwidth=40 -no-quit<cr>
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
" let g:vimfiler_trashbox_directory='~/.Trash'
" }}}

" caw {{{
nmap <leader>c gcc
vmap <leader>c gcc
" }}}

