au BufRead,BufNewFile *.ex,*.exs call s:setf('elixir')
au BufRead,BufNewFile *.eex call s:setf('eelixir')

au FileType elixir,eelixir setl sw=2 sts=2 et iskeyword+=!,?

au BufNewFile,BufRead * call s:DetectElixir()

function! s:setf(filetype) abort
  let &filetype = a:filetype
endfunction

function! s:DetectElixir()
  if getline(1) =~ '^#!.*\<elixir\>'
    call s:setf('elixir')
  endif
endfunction
" Language:    CoffeeScript
" Maintainer:  Mick Koch <mick@kochm.co>
" URL:         http://github.com/kchmck/vim-coffee-script
" License:     WTFPL

autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *Cakefile set filetype=coffee
autocmd BufNewFile,BufRead *.coffeekup,*.ck set filetype=coffee
autocmd BufNewFile,BufRead *._coffee set filetype=coffee

function! s:DetectCoffee()
    if getline(1) =~ '^#!.*\<coffee\>'
        set filetype=coffee
    endif
endfunction

autocmd BufNewFile,BufRead * call s:DetectCoffee()
