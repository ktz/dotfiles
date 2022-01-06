require'plugins'
vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
vim.cmd[[command! PackerInstall packadd packer.nvim | lua require'packer'.install()]]
vim.cmd[[command! PackerUpdate packadd packer.nvim | lua require'packer'.update()]]
vim.cmd[[command! PackerSync packadd packer.nvim | lua require'packer'.sync()]]
vim.cmd[[command! PackerClean packadd packer.nvim | lua require'packer'.clean()]]
vim.cmd[[command! PackerCompile packadd packer.nvim | lua require'packer'.compile()]]


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
" denite
let s:denite_options = {
     \ 'prompt' : '>',
     \ 'split': 'floating',
     \ 'start_filter': 1,
     \ 'auto_resize': 1,
     \ 'source_names': 'short',
     \ 'direction': 'botright',
     \ 'highlight_filter_background': 'CursorLine',
     \ 'highlight_matched_char': 'Type',
     \ }
call denite#custom#option('default', s:denite_options)

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> <c-t> denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <c-v> denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <c-x> denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

nnoremap <leader>f :Denite file<cr>
nnoremap <leader>b :Denite buffer<cr>
nnoremap <leader>m :Denite file_mru<cr>
nnoremap <leader>r :Denite file/rec<cr>
nnoremap <leader>g :Denite grep<cr>
" call denite#custom#map('_', '|', '<denite:do_action:vsplit>', 'noremap')
" call denite#custom#map('insert', '<up>', '<denite:move_to_previous_line>', 'noremap')
" call denite#custom#map('insert', '<down>', '<denite:move_to_next_line>', 'noremap')

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <tab> <Plug>(denite_filter_quit)
    inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    inoremap <silent><buffer><expr> <c-t> denite#do_map('do_action', 'tabopen')
    inoremap <silent><buffer><expr> <c-v> denite#do_map('do_action', 'vsplit')
    inoremap <silent><buffer><expr> <c-x> denite#do_map('do_action', 'split')
    inoremap <silent><buffer><expr> <esc> denite#do_map('quit')
    inoremap <silent><buffer> <C-j> <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
    inoremap <silent><buffer> <C-k> <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
endfunction

if executable('ag')
  call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--no-color', '--no-group', '-g', ''])
"   " call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--no-color', '--no-group', '-g', '', '-E', 'vendor/'])
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'default_opts', ['--follow', '--no-group', '--no-color'])
" " call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy', 'matcher/ignore_globs'])
  call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', [ '.git/', '_build/', 'images/', 'vendor/'])
  let s:ignore_globs = ['.git', '_build', 'images', 'vendor', 'node_modules']
  call denite#custom#var('file/rec', 'command', ['ag', '--follow'] + map(deepcopy(s:ignore_globs), { k, v -> '--ignore=' . v }) + ['--nocolor', '--nogroup', '-g', ''])
  call denite#custom#source('file/rec', 'matchers', ['matcher_fuzzy', 'matcher/ignore_globs'])
  call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', s:ignore_globs)
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'default_opts', ['--follow', '--no-group', '--no-color'])
end
]]


-- vim-commentary {{{
vim.api.nvim_set_keymap('n', '<leader>c', 'gcc', {noremap = false, silent = true})
vim.api.nvim_set_keymap('v', '<leader>c', 'gc', {noremap = false, silent = true})
-- }}}


-- nvim-tree {{{
vim.g.nvim_tree_show_icons = { git = 0, folders = 0, files = 0, folder_arrows = 0 }
vim.api.nvim_set_keymap('n', '<leader>d', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>u', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})
-- }}}


require('nvim-lsp-installer').on_server_ready(function(server)
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
  local enhance_server_opts = {
    ["elixirls"] = function(opts)
      opts.settings = {
        elixirLS = {
          dialyzerEnabled = false,
          fetchDeps = false
        }
      }
    end,
    ["sumneko_lua"] = function(opts)
      opts.cmd = { '/Users/' .. vim.fn.expand('$USER') .. '/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/macOS/lua-language-server' }
      opts.settings = {
        Lua = {
          diagnostics = {
            globals = {'vim'}
          }
        }
      }
    end,
  }
  local opts = {}
  opts.on_attach = on_attach
  opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  if enhance_server_opts[server.name] then
    enhance_server_opts[server.name](opts)
  end

  server:setup(opts)

end)


require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
  },
  ensure_installed = 'maintained',
}


local cmp = require"cmp"
vim.opt.completeopt = "menu,menuone,noselect"
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }, {
    { name = "buffer" },
  })
})


local null_ls = require("null-ls")
null_ls.setup({
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
  sources = {
    null_ls.builtins.formatting.clang_format,
    -- null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.mix,
    null_ls.builtins.formatting.prettier.with({
      extra_filetypes = {'svelte'}
    }),
    null_ls.builtins.diagnostics.cppcheck,
    null_ls.builtins.diagnostics.credo,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.code_actions.eslint_d
  },
})


local trouble = require('trouble')
trouble.setup {
  mode = "workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
  auto_open = true,
  auto_close = true,
  use_diagnostic_signs = true
}

local nightfox = require('nightfox')
nightfox.setup {
  fox = 'nightfox',
  transparent = true
}
nightfox.load()


local lualine = require('lualine')
lualine.setup {
  options = {
    theme = 'nightfox',
    icons_enabled = false,
    icon = nil
  }
}

vim.cmd[[
command! Profile call s:command_profile()
function! s:command_profile() abort
  profile start ~/Desktop/profile.txt
  profile func *
  profile file *
endfunction
]]
