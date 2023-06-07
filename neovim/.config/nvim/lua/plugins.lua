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

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function()
      require('telescope').setup({
        vim.cmd[[
        nnoremap <leader>f <cmd>Telescope find_files<cr>
        nnoremap <leader>g <cmd>Telescope live_grep<cr>
        ]]
      })
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup({
        renderer = {
          icons = {
            show = {
              file = false,
              folder = false,
              folder_arrow = false,
              git = false
            }
          }
        }
      })
      vim.api.nvim_set_keymap('n', '<leader>d', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<leader>u', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})
    end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
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
        options = {
          transparent = true
        }
      })
      vim.cmd[[colorscheme nightfox]]
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

  use {'mg979/vim-visual-multi'}
  use {'tpope/vim-surround'}
  use 'JoosepAlviste/nvim-ts-context-commentstring'

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

          if client.name == 'gopls' then
            client.server_capabilities.document_formatting = false
          end
          if client.name == 'denols' then
            client.server_capabilities.document_formatting = false
          end
          if client.name == 'tsserver' then
            client.server_capabilities.document_formatting = false
          end
          if client.name == 'elixirls' then
            client.server_capabilities.document_formatting = false
          end
        end
        local enhance_server_opts = {
          -- ["sumneko_lua"] = function(opts)
          --   opts.cmd = { '/Users/' .. vim.fn.expand('$USER') .. '/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/macOS/lua-language-server' }
          --   opts.settings = {
          --     Lua = {
          --       diagnostics = {
          --         globals = {'vim'}
          --       }
          --     }
          --   }
          -- end,
          ["lua_ls"] = function(opts)
            opts.settings = {
              Lua = {
                diagnostics = {
                  globals = {'vim'}
                },
                workspace = {
                  library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                  }
                }
              }
            }
          end,
          -- ['gopls'] = function(opts)
          --   opts.settings = {
          --     buildFlags = {"-tags=wireinject"},
          --     init_options = {
          --       buildFlags = {"-tags=wireinject"}
          --     }
          --   }
          -- end,
          ['denols'] = function(opts)
            opts.settings = {
              init_options = {
                lint = true,
                unstable = true,
                preferences = {
                  disableSuggestions = true
                }
              }
            }
          end,

        }
        local opts = {}

        opts.on_attach = on_attach
        -- opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
        opts.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
        if enhance_server_opts[server.name] then
          enhance_server_opts[server.name](opts)
        end
        server:setup(opts)
        -- vim.cmd [[ do User LspAttachBuffers ]]
      end)
    end
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      local null_ls = require('null-ls')
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local code_actions = null_ls.builtins.code_actions
      null_ls.setup({
        on_attach = function(client)
          if client.server_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
          end
        end,
        sources = {
          formatting.clang_format,
          formatting.goimports,
          formatting.mix,
          formatting.prettier,
          -- formatting.prettier.with({
          --   extra_filetypes = {'svelte'}
          -- }),
          -- formatting.deno_fmt,
          diagnostics.cppcheck,
          diagnostics.credo,
          -- diagnostics.eslint_d,
          diagnostics.hadolint,
          code_actions.gitsigns
        },
      })
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
        ensure_installed = 'all',
      })
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip'},
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
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
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

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('indent_blankline').setup({
      filetype_exclude = {'NvimTree', 'denite', 'denite-filter'},
      show_current_context = true,
      show_current_context_start = true
    }) end
  }
end

return setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})
