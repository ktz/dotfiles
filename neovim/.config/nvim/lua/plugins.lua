vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {
    'wbthomason/packer.nvim',
    opt = true
  }
  use 'roxma/nvim-yarp'
  use 'roxma/vim-hug-neovim-rpc'
  use 'Shougo/denite.nvim'
  use 'Shougo/neomru.vim'
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'nvim-tree'.setup {} end
  }
  use 'tpope/vim-commentary'
  use 'jreybert/vimagit'
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'EdenEast/nightfox.nvim'
  -- use {
  --   'EdenEast/nightfox.nvim',
  --   config = function() require('nightfox').setup({
  --     fox = 'nightfox',
  --     transparent = true
  --   }).load() end
  -- }
  use 'nvim-lualine/lualine.nvim'
  -- use {
  --   'nvim-lualine/lualine.nvim',
  --   config = function() require('lualine').setup({
  --     options = {
  --       theme = 'nightfox',
  --       icons_enabled = false,
  --       icon = nil
  --     }
  --   }) end
  -- }
  use 'tpope/vim-surround'
  use 'terryma/vim-multiple-cursors'
  use 'Raimondi/delimitMate'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
end)
