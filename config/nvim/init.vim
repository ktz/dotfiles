" let $VIMRUNTIME=/user/local/Cellar/neovim/0.2.1/share/nvim/runtime
" if &compatible
"   set nocompatible
" endif
let g:python3_host_prog = expand('/usr/local/bin//python3')
if (!isdirectory(expand('~/.config/nvim/repos/github.com/Shougo/dein.vim')))
  call system(expand('mkdir -p ~/.config/nvim/repos/github.com'))
  call system(expand('git clone https://github.com/Shougo/dein.vim ~/.config/nvim/repos/github.com/Shougo/dein.vim'))
endif
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
if dein#load_state(expand('~/.config/nvim'))
  " let s:plugins = expand('~/.config/nvim/plugins.toml')
  " let s:lazy_plugins = expand('~/.config/nvim/lazy_plugins.toml')
  call dein#begin(expand('~/.config/nvim'))
  " call dein#load_toml(s:plugins, {'lazy': 0})
  " call dein#load_toml(s:lazy_plugins, {'lazy': 1})
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('tyru/caw.vim')
  call dein#add('jreybert/vimagit')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('itchyny/lightline.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('konfekt/FastFold')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('elixir-editors/vim-elixir')
  call dein#add('slashmili/alchemist.vim')
  call dein#add('w0rp/ale')
  call dein#add('pangloss/vim-javascript')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('fatih/vim-go')
  call dein#add('elmcast/elm-vim')

  " call dein#add('Shougo/deoplete.nvim')
  " call dein#add('Shougo/defx.nvim')
  " if !has('nvim')
  "   call dein#add('roxma/nvim-yarp')
  "   call dein#add('roxma/vim-hug-neovim-rpc')
  " endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
colorscheme hybrid
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
" set cursorline
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

augroup AutoCmd
  autocmd!
augroup END

" denite {{{
if executable('ag')
  call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--no-color', '--no-group', '-g', ''])
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'default_opts', ['--follow', '--no-group', '--no-color'])
end
" call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
" call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', [ '.git/', '_build/', 'images'])
nnoremap <leader>f :Denite file -mode=normal<cr>
nnoremap <leader>b :Denite buffer -mode=normal<cr>
nnoremap <leader>m :Denite file_mru<cr>
nnoremap <leader>r :Denite file_rec<cr>
nnoremap <leader>g :Denite grep -mode=normal -buffer-name=search-buffer-denite<cr>
call denite#custom#map('_', '|', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('insert', '<up>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<down>', '<denite:move_to_next_line>', 'noremap')
" }}}

" deoplete {{{
" let g:deoplete#enable_at_startup = 1
" }}}

" caw {{{
nmap <leader>c gcc
vmap <leader>c gcc
" }}}
"
" ale {{{
set statusline+=%#warningmsg#
set statusline+=%{ALEGetStatusLine()}
set statusline+=%*
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" let g:ale_lint_on_text_changed=0
" let g:ale_set_loclist=0
" let g:ale_set_quickfix=1
let g:ale_open_list=1
autocmd QuitPre * if empty(&bt) | lclose | endif

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier-eslint']
let g:ale_fix_on_save=1
let g:ale_javascript_prittier_use_local_config=1
" }}}

" elm-vim {{{
let g:polyglot_disabled = ['elm']
let g:elm_detailed_complete=1
let g:elm_format_autosave=1
" let g:elm_syntastic_show_warnings=1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 0
" call deoplete#util#set_default(
"   \ 'g:deoplete#omni#input_patterns',
"   \ 'elm',
"   \ '\.')
" }}}

