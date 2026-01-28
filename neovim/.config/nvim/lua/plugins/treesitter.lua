return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
	-- config = function()
	-- 	local configs = require("nvim-treesitter.configs")
	-- 	configs.setup({
	-- 		highlight = {
	-- 			enable = true,
	-- 			disable = {},
	-- 		},
	-- 		indent = {
	-- 			enable = true,
	-- 		},
	-- 		auto_install = true,
	-- 		sync_install = false,
	-- 		ensure_installed = 'all',
	-- 		ignore_install = {},
	-- 		incremental_selection = {
	-- 			enable = true,
	-- 			keymaps = {
	-- 				init_selection = "<Enter>",
	-- 				node_incremental = "<Enter>",
	-- 				scope_incremental = false,
	-- 				node_decremental = "<Backspace>",
	-- 			}
	-- 		}
	-- 	})
	-- end
}
