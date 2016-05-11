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
call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-surround')
call dein#add('konfekt/FastFold')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('nanotech/jellybeans.vim')
call dein#add('elixir-lang/vim-elixir')
call dein#add('scrooloose/syntastic')
" call dein#add('ryanoasis/vim-devicons')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
if dein#check_install()
  call dein#install()
  let pluginExist=1
endif
call dein#end()
filetype plugin indent on

syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
colorscheme jellybeans
set mouse=
set background=dark
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
nnoremap <silent> [unite] :Unite file<cr>
nnoremap <silent> [unite]y :Unite history/yank<cr>
nnoremap <silent> [unite]b :Unite buffer<cr>
nnoremap <silent> [unite]f :Unite file_mru<cr>
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
" }}}

" vimfiler {{{
" nnoremap [vimfiler] <Nop>
" nmap <leader>f [vimfiler]
" nnoremap <silent> [vimfiler]f :VimFiler -split -simple -winwidth=40 -no-quit<cr>
" nnoremap <silent> [vimfiler]c :VimFilerCurrentDir -split -simple -winwidth=40 -no-quit<cr>
nnoremap <leader>f :VimFiler -split -simple -winwidth=40 -no-quit<cr>
nnoremap <leader>h :VimFilerCurrentDir -split -simple -winwidth=40 -no-quit<cr>
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
" let g:vimfiler_trashbox_directory='~/.Trash'
" }}}

" caw {{{
nmap <leader>c gcc
vmap <leader>c gcc
" }}}

" deoplete {{{
let g:deoplete#enable_at_startup=1
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" }}}

" syntastic {{{
let g:syntastic_javascript_checkers=["eslint"]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_poplulate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
" let g:syntastic_mode_map = {'mode': 'passive'} 
" augroup AutoSyntastic
"     autocmd!
"     autocmd InsertLeave,TextChanged * call s:syntastic() 
" augroup END
" function! s:syntastic()
"     w
"     SyntasticCheck
" endfunction
" }}}

" vim-jsx {{{
let g:jsx_ext_required=0
" }}}
