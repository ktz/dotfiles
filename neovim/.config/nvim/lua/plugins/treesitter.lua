-- vim.uv.fs_mkdir(parser_dir, tonumber("755", 8))

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({ install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "/treesitter") })
		local langs = {
			"css",
			"dockerfile",
			"go",
			"html",
			"javascript",
			"jq",
			"json",
			"sql",
			"svelte",
			"tsx",
			"typescript",
			"yaml",
			"zsh",
		}
		require("nvim-treesitter").install(langs)
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
			pattern = langs,
			callback = function(args)
				vim.treesitter.start(args.buf)
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				-- pcall(vim.treesitter.start)
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
