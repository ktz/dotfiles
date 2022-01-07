local packer = nil
local function init()
  if packer == nil then
    packer = require('packer')
    packer.init({
      disable_commands = true,
      display = {
        open_fn = require('packer.util').float
      }
    })
  end
  local use = packer.use
  packer.reset()

  use {'wbthomason/packer.nvim', opt = true}

  use 'roxma/nvim-yarp'

  use 'roxma/vim-hug-neovim-rpc'

  use 'Shougo/neomru.vim'

  use {
    'Shougo/denite.nvim',
    config = function()
    vim.cmd[[
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
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    setup = function()
      vim.g.nvim_tree_show_icons = { git = 0, folders = 0, files = 0, folder_arrows = 0 }
      vim.api.nvim_set_keymap('n', '<leader>d', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<leader>u', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})
    end,
    config = function() require'nvim-tree'.setup() end
  }

  use {
    'tpope/vim-commentary',
    setup = function()
      vim.api.nvim_set_keymap('n', '<leader>c', 'gcc', {noremap = false, silent = true})
      vim.api.nvim_set_keymap('v', '<leader>c', 'gc', {noremap = false, silent = true})
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('gitsigns').setup() end
  }

  use 'tpope/vim-fugitive'

  use {
    'EdenEast/nightfox.nvim',
    config = function()
      local nightfox = require('nightfox')
      nightfox.setup({
        fox = 'nightfox',
        transparent = true
      })
      nightfox.load()
      -- vim.cmd[[colorscheme nightfox]]
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          theme = 'nightfox',
          icons_enabled = false,
          icon = nil
        }
      })
    end
  }
  use {
    'phaazon/hop.nvim',
    branch = 'v1',
    config = function()
      require'hop'.setup({ keys = 'etovxqpdygfblzhckisuran' })
      vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char2()<cr>", {})
      vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({current_line_only = true})<cr>", {})
    end
  }

  use {'terryma/vim-multiple-cursors', opt = true}

  use {'tpope/vim-surround', opt = true}

  use {
    'windwp/nvim-autopairs',
    requires = 'hrsh7th/nvim-cmp',
    config = function()
      require('nvim-autopairs').setup()
      require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done({map_char = {text = ''}}))
    end
  }

  use 'neovim/nvim-lspconfig'
  use {
    'williamboman/nvim-lsp-installer',
    requires = {'neovim/nvim-lspconfig' , 'hrsh7th/cmp-nvim-lsp'},
    config = function()
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
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = true,
          disable = {}
        },
        indent = {
          enable = true,
        },
        ensure_installed = 'maintained',
      })
    end
  }

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      vim.opt.completeopt = 'menu,menuone,noselect'
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
          end,
        },
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
        }, {
          { name = 'buffer' },
        })
      })
    end
  }

  use 'hrsh7th/cmp-nvim-lsp'

  use 'hrsh7th/cmp-vsnip'

  use 'hrsh7th/cmp-buffer'

  use 'hrsh7th/vim-vsnip'

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      local null_ls = require('null-ls')
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
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.code_actions.gitsigns
        },
      })
    end
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('trouble').setup({
      mode = "workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
      auto_open = true,
      auto_close = true,
      use_diagnostic_signs = true
    }) end
  }
end

return setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})