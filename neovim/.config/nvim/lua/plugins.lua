vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}
  use 'roxma/nvim-yarp'
  use 'roxma/vim-hug-neovim-rpc'
  use 'Shougo/denite.nvim'
  use 'Shougo/neomru.vim'
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'nvim-tree'.setup() end
  }
  use 'tpope/vim-commentary'
  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('gitsigns').setup() end
  }
  use 'tpope/vim-fugitive'
  use 'EdenEast/nightfox.nvim'
  use 'nvim-lualine/lualine.nvim'
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
    config = function() require'hop'.setup({ keys = 'etovxqpdygfblzhckisuran' }) end
  }
  use {'terryma/vim-multiple-cursors', opt = true}
  use {'tpope/vim-surround', opt = true}
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  }
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
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
end)
