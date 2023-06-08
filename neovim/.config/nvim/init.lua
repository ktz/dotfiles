vim.cmd[[
hi ZenkakuSpace ctermbg=red guibg=#ff0000
au BufNewFile,BufRead * match ZenkakuSpace /　/
autocmd BufNewFile,BufRead Dockerfile.* set filetype=dockerfile
]]
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.list = true
vim.opt.listchars:append('space:⋅')
vim.opt.listchars:append('eol:↴')
vim.opt.listchars:append('tab:▸\\')
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
-- vim.api.nvim_set_keymap('n', '<esc><esc>', {noremap = true, silent = true})


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
    'nvim-telescope/telescope.nvim',
    keys = {
      {"<leader>f", "<cmd>Telescope find_files<cr>"},
      {"<leader>g", "<cmd>Telescope live_grep<cr>"}
    },
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },
  {
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
      vim.api.nvim_set_keymap('n', '<leader>d', ':NvimTreeToggle<cr>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<leader>u', ':NvimTreeRefresh<cr>', {noremap = true, silent = true})
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
      vim.api.nvim_set_keymap('n', '<leader>c', 'gcc', {noremap = false, silent = true})
      vim.api.nvim_set_keymap('v', '<leader>c', 'gc', {noremap = false, silent = true})
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
      vim.cmd[[colorscheme nightfox]]
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
  {
    'phaazon/hop.nvim',
    branch = 'v1',
    config = function()
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
      vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require('hop').hint_char2()<cr>", {})
      vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require('hop').hint_char1({current_line_only = true})<cr>", {})
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
      require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done({map_char = {text = ''}}))
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
        ensure_installed = 'all',
      })
    end
  },
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    config = function()
      require('mason').setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    -- dependencies = 'williamboman/mason.nvim',
    config = function()
      require('mason-lspconfig').setup()
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local opt = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = function(_, bufnr)
          local bufopts = {silent = true, buffer = bufnr}
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
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = {'vim'}
            },
          }
        }
      })
      require('lspconfig').rust_analyzer.setup(opt)
      require('lspconfig').tsserver.setup(opt)
    end
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
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
          formatting.deno_fmt,
          formatting.gofmt,
          formatting.goimports,
          formatting.jq,
          formatting.mix,
          formatting.rustfmt,
          -- formatting.prettier,
          -- formatting.prettier.with({
          --   extra_filetypes = {'svelte'}
          -- }),
          diagnostics.cppcheck,
          diagnostics.credo,
          diagnostics.deno_lint,
          -- diagnostics.eslint_d,
          diagnostics.hadolint,
          diagnostics.jsonlint,
          code_actions.gitsigns
        },
      })
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip'},
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
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function() require('trouble').setup({
      mode = "workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
      auto_open = true,
      auto_close = true,
      use_diagnostic_signs = true
    }) end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('indent_blankline').setup({
      filetype_exclude = {'NvimTree', 'denite', 'denite-filter'},
      show_current_context = true,
      show_current_context_start = true
    }) end
  }
})
