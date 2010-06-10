set nocompatible
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
"set listchars=tab:>>
set wildmenu
set hlsearch
"set autoindent
set smartindent
set title
set tabstop=2
set shiftwidth=2
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
    

syntax on
hi LineNr ctermbg=black
"hi SpecialKey ctermfg=lightgrey
"hi NonText ctermfg=gray
"hi Comment ctermfg=brown
filetype on
filetype plugin indent on
au InsertEnter * hi StatusLine term=reverse ctermfg=1
au InsertLeave * hi StatusLine term=reverse ctermfg=2
au QuickfixCmdPost vimgrep cw
au QuickfixCmdPost grep cw
au FileType css,eruby,html,java,js,Rails-js,python,ruby,scala,xml,yaml set sw=2 sts=2
au FileType ruby,eruby set omnifunc=rubycomplete#Complete

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

hi ZenkakuSpace ctermbg=red
au BufNewFile,BufRead * match ZenkakuSpace /　/

map <leader>c ,c<space>
nmap <leader>ff :FufFile<CR>
nmap <leader>d :NERDTreeToggle<CR>

if has('mac') && !has('gui')
  map <silent> <leader>y :w !pbcopy<CR><CR>
  map <silent> <leader>p :r !pbpaste<CR>
else
  nmap <leader>y "+y
  nmap <leader>p "+p
endif

