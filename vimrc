set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
"set rtp+=~/.vim/vundle.git/
call vundle#rc()
Bundle "gmarik/vundle"
Bundle "https://github.com/Shougo/unite.vim.git"
Bundle "https://github.com/Shougo/vimfiler.vim.git"
Bundle "surround.vim"
Bundle "YankRing.vim"
Bundle "https://github.com/tyru/caw.vim.git"
Bundle "vim-coffee-script"
Bundle "grep.vim"
Bundle "html5.vim"
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rails"
Bundle "groenewege/vim-less"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"
Bundle "jellybeans.vim"
Bundle "derekwyatt/vim-scala"
Bundle "https://github.com/nathanaelkane/vim-indent-guides.git"
Bundle "https://github.com/junegunn/vim-easy-align.git"
filetype plugin indent on
let g:snippets_dir = $HOME."./.vim/snippets"

set enc=utf-8
set fenc=utf-8
set fencs=utf-8,cp932,iso-2022-jp,euc-jp
"set ignorecase
"set background=dark
set smartcase
set wrapscan
set noincsearch
set number
set list
"set listchars=tab:>>t
set listchars=eol:¬,tab:▸\
set wildmenu
set hlsearch
"set autoindent
set smartindent
set title
set tabstop=2
set shiftwidth=2
set softtabstop=2
set showcmd
set expandtab
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set backspace=indent,eol,start
set formatoptions=lmoq
set autoread
set nobackup
set noswapfile
set vb t_vb=
set grepprg=grep\ -nH

set foldmethod=syntax
set foldlevel=5

syntax on
hi LineNr ctermbg=black
"hi SpecialKey ctermfg=lightgrey
"hi NonText ctermfg=gray
"hi Comment ctermfg=brown
"filetype on
"filetype plugin indent on
au InsertEnter * hi StatusLine term=reverse ctermfg=1
au InsertLeave * hi StatusLine term=reverse ctermfg=2
au QuickfixCmdPost vimgrep cw
au QuickfixCmdPost grep cw
"au FileType css,eruby,html,java,js,Rails-js,python,ruby,scala,xml,yaml set sw=2 sts=2
au FileType ruby,eruby set omnifunc=rubycomplete#Complete

colorscheme default
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=000
hi IndentGuidesEven ctermbg=234

let g:yankring_manual_clipboard_check = 0
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

hi ZenkakuSpace ctermbg=red
au BufNewFile,BufRead * match ZenkakuSpace /　/

map <Esc><Esc> :noh<cr>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

nnoremap [unite] <Nop>
nmap <leader>u [unite]
nnoremap <silent> [unite]f :Unite file<cr>
nnoremap <silent> [unite]b :Unite buffer<cr>
nnoremap <silent> [unite]r :Unite file_mru<cr>

nnoremap <leader>f :VimFiler<cr>

nmap <leader>c <Plug>(caw:i:toggle)
vmap <leader>c <Plug>(caw:i:toggle)

vmap <enter> <plug>(EasyAlign)
nmap <leader>a <plug>(EasyAlign)

if has('mac') && !has('gui')
  map <silent> <leader>y :w !pbcopy<cr><cr>
  map <silent> <leader>p :r !pbpaste<cr>
else
  nmap <leader>y "+y
  nmap <leader>p "+p
endif

"taglist
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1
"map <silent> <leader>tl :TlistToggle<cr>

"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
autocmd! bufwritepost .vimrc source ~/.vimrc

