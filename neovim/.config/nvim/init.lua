vim.cmd [[
hi ZenkakuSpace ctermbg=red guibg=#ff0000
au BufNewFile,BufRead * match ZenkakuSpace /　/
autocmd BufNewFile,BufRead Dockerfile.* set filetype=dockerfile
]]
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.list = true
-- vim.opt.listchars:append('space:⋅')
vim.opt.listchars:append('eol:↴')
-- vim.opt.listchars:append('tab:▸\\')
vim.o.clipboard = 'unnamedplus'
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.keymap.set('n', 'Q', '<nop>', { noremap = true, silent = true })
vim.keymap.set('n', 'q', ':noh<cr>', { noremap = true, silent = true })

vim.filetype.add({
  extension = {
    templ = "templ"
  }
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'direnv/direnv.vim'
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim' },
    config = function()
      require('telescope').load_extension 'file_browser'
    end,
    keys = {
      { '<leader>f', '<cmd>Telescope find_files<cr>' },
      { '<leader>F', '<cmd>Telescope find_files hidden=true<cr>' },
      { '<leader>g', '<cmd>Telescope live_grep<cr>' },
      { '<leader>d', '<cmd>Telescope file_browser<cr>' }
    },
  },
  -- {
  --   'kyazdani42/nvim-tree.lua',
  --   config = function()
  --     require('nvim-tree').setup({
  --       renderer = {
  --         icons = {
  --           show = {
  --             file = false,
  --             folder = false,
  --             folder_arrow = false,
  --             git = false
  --           }
  --         }
  --       }
  --     })
  --     vim.keymap.set('n', '<leader>d', '<cmd>NvimTreeToggle<cr>')
  --     vim.keymap.set('n', '<leader>u', '<cmd>NvimTreeRefresh<cr>')
  --   end,
  -- },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
      vim.api.nvim_set_keymap('n', '<leader>c', 'gcc', { noremap = false, silent = true })
      vim.api.nvim_set_keymap('v', '<leader>c', 'gc', { noremap = false, silent = true })
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  },
  { 'tpope/vim-fugitive' },
  {
    'EdenEast/nightfox.nvim',
    config = function()
      local nightfox = require('nightfox')
      nightfox.setup({
        options = {
          transparent = true
        }
      })
      vim.cmd [[colorscheme nightfox]]
    end,
  },
  {
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
  },
  -- {
  --   'phaazon/hop.nvim',
  --   branch = 'v1',
  --   config = function()
  --     require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
  --     vim.keymap.set('n', 'F', "<cmd>lua require('hop').hint_char2()<cr>", {})
  --     vim.keymap.set('n', 'f', "<cmd>lua require('hop').hint_char1({current_line_only = true})<cr>", {})
  --   end
  -- },
  {
    'smoka7/hop.nvim',
    version = '*',
    config = function()
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
      vim.keymap.set('n', 'F', "<cmd>lua require('hop').hint_char2()<cr>", {})
      vim.keymap.set('n', 'f', "<cmd>lua require('hop').hint_char1({current_line_only = true})<cr>", {})
    end
  },
  { 'mg979/vim-visual-multi' },
  { 'tpope/vim-surround' },
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
  {
    'windwp/nvim-autopairs',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup()
      require('cmp').event:on('confirm_done',
        require('nvim-autopairs.completion.cmp').on_confirm_done({ map_char = { text = '' } }))
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = true,
          disable = {}
        },
        indent = {
          enable = true,
        },
        auto_install = true,
        ensure_installed = 'all',
        sync_install = false,
        ignore_install = {},
      })
    end
  },
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup()
      require('mason-lspconfig').setup_handlers {
        function(server_name)
          local opt = {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            on_attach = function(_, bufnr)
              local bufopts = { silent = true, buffer = bufnr }
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
              vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
              vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
              vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
              vim.keymap.set('n', '<space>e', vim.lsp.buf.diagnostic.open_float, bufopts)
              vim.keymap.set('n', '[d', vim.lsp.buf.diagnostic.goto_prev, bufopts)
              vim.keymap.set('n', ']d', vim.lsp.buf.diagnostic.goto_next, bufopts)
            end
          }
          require('lspconfig')[server_name].setup { opt }
        end,
        ['gopls'] = function()
          require('lspconfig').gopls.setup {
            settings = { gopls = {
              buildFlags = { "-tags=wireinject" }
            } }
          }
        end,
        ['lua_ls'] = function()
          require('lspconfig').lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file('', true),
                  checkThirdParty = false
                }
              }
            }
          }
        end,
        ['rust_analyzer'] = function()
          require('lspconfig').rust_analyzer.setup {
            settings = {
              procMacro = {
                ignored = {
                  leptos_macro = {
                    'component',
                    'server',
                  }
                }
              }
            }
          }
        end,
        -- ['rust_analyzer'] = function()
        --   require('lspconfig').rust_analyzer.setup {
        --     settings = {
        --       ['rust-analyzer'] = {
        --         cargo = {
        --           allFeatures = true
        --         }
        --       },
        --       cargo = {
        --         allFeatures = true,
        --         buildScripts = {
        --           enable = true
        --         }
        --       },
        --       checkOnSave = {
        --         command = "clippy"
        --       },
        --       diagnostics = {
        --         disabled = {'inactive-code', 'unresolved-proc-macro'}
        --       },
        --       procMacro = {
        --         enable = true
        --       }
        --     }
        --   }
        -- end
      }
    end
  },
  {
    'simrat39/rust-tools.nvim',
    config = function()
      local rt = require('rust-tools')
      rt.setup({
        server = {
          cargo = {
            features = 'all'
          },
          on_attach = function(_, bufnr)
            vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
          settings = {
            ['rust-analyzer'] = {
              -- cargo = {
              --   features = 'all'
              -- },
              checkOnSave = {
                command = 'clippy'
              },
              -- diagnostics = {
              --   disabled = 'unresolved-proc-macro'
              -- },
            }
          }
        }
      })
    end
  },
  -- {
  --   -- 'jose-elias-alvarez/null-ls.nvim',
  --   'nvimtools/none-ls.nvim',
  --   dependencies = {'nvim-lua/plenary.nvim'},
  --   config = function()
  --     local null_ls = require('null-ls')
  --     local formatting = null_ls.builtins.formatting
  --     local diagnostics = null_ls.builtins.diagnostics
  --     local code_actions = null_ls.builtins.code_actions
  --     null_ls.setup({
  --       on_attach = function(client)
  --         if client.server_capabilities.document_formatting then
  --           vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  --         end
  --       end,
  --       sources = {
  --         formatting.clang_format,
  --         formatting.deno_fmt,
  --         formatting.gofmt,
  --         formatting.goimports,
  --         formatting.jq,
  --         formatting.mix,
  --         -- formatting.rustfmt,
  --         -- formatting.prettier,
  --         -- formatting.prettier.with({
  --         --   extra_filetypes = {'svelte'}
  --         -- }),
  --         diagnostics.cppcheck,
  --         diagnostics.credo,
  --         -- diagnostics.deno_lint,
  --         -- diagnostics.eslint_d,
  --         diagnostics.hadolint,
  --         diagnostics.jsonlint,
  --         code_actions.gitsigns
  --       },
  --     })
  --   end
  -- },
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip' },
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
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-l>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          --   { name = 'vsnip' },
          -- }, {
          --   { name = 'buffer' },
        })
      })
    end
  },
  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      auto_open = true,
      auto_close = true,
      use_diagnostic_signs = true,
    }
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup({
      })
    end
  },
  {
    'elentok/format-on-save.nvim',
    config = function()
      local format_on_save = require('format-on-save')
      local formatters = require('format-on-save.formatters')
      format_on_save.setup({
        exclude_path_patterns = {
          '/node_modules/',
          '.local/share/nvim/lazy',
        },
        formatter_by_ft = {
          css = formatters.lsp,
          -- go = formatters.lsp,
          html = formatters.lsp,
          javascript = formatters.lsp,
          json = formatters.lsp,
          lua = formatters.lsp,
          markdown = formatters.prettierd,
          rust = formatters.lsp,
          scss = formatters.lsp,
          typescript = formatters.prettierd,
          yaml = formatters.lsp,
          go = {
            -- formatters.shell({
            --   cmd = { 'goimports-reviser', '-rm-unused', '-set-alias', '-format', '%' },
            --   tempfile = function()
            --     return vim.fn.expand('%') .. '.formatter-temp'
            --   end
            -- }),
            formatters.shell({ cmd = { 'gofmt' } })
          }
        },
        fallback_formatter = {
          formatters.remove_trailing_whitespace,
          formatters.prettiers,
        },
      })
    end
  },
  { 'vim-denops/denops.vim' },
  {
    'vim-skk/skkeleton',
    dependencies = { 'vim-denops/denops.vim' },
    config = function()
      vim.keymap.set('i', '<C-j>', '<Plug>(skkeleton-toggle)', { remap = true })
      vim.fn['skkeleton#config']({
        globalDictionaries = {
          '~/.skk/SKK-JISYO.L',
          '/usr/share/skk/SKK-JISYO.L'
        }
      })
    end
  }

})
