vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
vim.cmd[[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
vim.cmd[[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
vim.cmd[[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
vim.cmd[[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd[[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]


vim.cmd[[
hi ZenkakuSpace ctermbg=red guibg=#ff0000
au BufNewFile,BufRead * match ZenkakuSpace /　/
autocmd BufNewFile,BufRead Dockerfile.* set filetype=dockerfile
]]
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.backup = false
vim.o.swapfile = false
-- vim.o.list = true
-- vim.o.listchars = 'eol:¬,tab:▸\\'
-- vim.cmd[[set clipboard+=unnameplus]]
vim.o.clipboard = 'unnamedplus'
vim.wo.number = true
vim.wo.cursorline = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.api.nvim_set_keymap('n', 'Q', '<nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'q', ':noh<cr>', {noremap = true, silent = true})

vim.cmd[[
command! Profile call s:command_profile()
function! s:command_profile() abort
  profile start ~/Desktop/profile.txt
  profile func *
  profile file *
endfunction
]]
