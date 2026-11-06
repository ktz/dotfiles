local gh = function(repo)
	return "https://github.com/" .. repo
end

vim.pack.add({
	{ src = gh("saghen/blink.compat"), version = vim.version.range("*") },
	{ src = gh("saghen/blink.cmp"), version = vim.version.range("1") },
	{ src = gh("rafamadriz/friendly-snippets") }, -- blink deps
	{ src = gh("ray-x/cmp-sql") }, -- blink deps
	{ src = gh("numToStr/Comment.nvim") },
	{ src = gh("stevearc/conform.nvim") },
	{ src = gh("folke/flash.nvim") },
	{ src = gh("lewis6991/gitsigns.nvim") },
	{ src = gh("nvim-lua/plenary.nvim") }, --gitsigns deps
	{ src = gh("EdenEast/nightfox.nvim") },
	{ src = gh("windwp/nvim-autopairs") },
	{ src = gh("neovim/nvim-lspconfig") },
	{ src = gh("nvim-lualine/lualine.nvim") },
	{ src = gh("williamboman/mason.nvim") }, -- nvim-lspconfig deps
	{ src = gh("williamboman/mason-lspconfig.nvim") }, -- nvim-lspconfig deps
	{ src = gh("WhoIsSethDaniel/mason-tool-installer.nvim") }, -- nvim-lspconfig deps
	{ src = gh("folke/noice.nvim") },
	{ src = gh("MunifTanjim/nui.nvim") }, -- noice deps
	{ src = gh("j-hui/fidget.nvim") }, -- nvim-lspconfig deps
	{ src = gh("b0o/schemastore.nvim") }, -- nvim-lspconfig deps
	{ src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
	{ src = gh("nvim-treesitter/nvim-treesitter-textobjects"), version = "main" },
	{ src = gh("stevearc/oil.nvim") },
	{ src = gh("mrcjkb/rustaceanvim"), version = vim.version.range("^6") },
	{ src = gh("folke/snacks.nvim") },
	{ src = gh("akinsho/toggleterm.nvim"), version = vim.version.range("*") },
	{ src = gh("folke/trouble.nvim") },
	{ src = gh("nvim-tree/nvim-web-devicons") }, -- trouble, lualine deps
	{ src = gh("tpope/vim-surround") }, -- no setup needed
	{ src = gh("folke/which-key.nvim") },
	{ src = gh("MeanderingProgrammer/render-markdown.nvim") },
})

require("plugins.snacks")
require("plugins.nightfox")

require("gitsigns").setup({})
require("render-markdown").setup({})

require("plugins.blink")
require("plugins.conform")
require("plugins.flash")
require("plugins.lualine")
require("plugins.noice")
require("plugins.nvim-autopairs")
require("plugins.nvim-lspconfig")
require("plugins.nvim-treesitter")
require("plugins.nvim-treesitter-textobjects")
require("plugins.oil")
require("plugins.rustaceanvim")
require("plugins.toggleterm")
require("plugins.trouble")
require("plugins.which-key")
