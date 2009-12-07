set enc=utf-8
set fenc=utf-8
set fencs=utf-8,cp932,iso-2022-jp,euc-jp
 
""set ignorecase
set smartcase
set wrapscan
set noincsearch
 
syntax on
set number
set wildmenu
set hlsearch
""set autoindent
set smartindent
set title
set tabstop=2
set shiftwidth=2
set showcmd
set expandtab
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

au InsertEnter * hi StatusLine term=reverse ctermfg=1
au InsertLeave * hi StatusLine term=reverse ctermfg=2
 
filetype on
filetype plugin indent on

autocmd FileType css,eruby,html,Rails-js,python,ruby,scala,xml,yaml set sw=2 sts=2
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType php set dictionary=~/.vim/dictionary/php.dict
 
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
 
map <Leader>c ,c<space>
"nnoremap <silent>ff :FuzzyFinderFile<CR>
nnoremap <Leader>ff :FuzzyFinderFile<CR>
"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
"au BufNewFile,BufRead * match ZenkakuSpace /　/

vmap <C-C> "*y
imap <C-V> <ESC>"*pa
vmap <C-V> d"*P
cmap <C-V> <C-R>*
vmap <C-X> "*d<ESC>
vmap <C-C> "*y"
