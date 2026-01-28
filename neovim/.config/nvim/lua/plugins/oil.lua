return {
	"stevearc/oil.nvim",
	-- ---@module 'oil'
	-- ---@type oil.SetupOpts
	opts = {
		view_options = {
			show_hidden = true,
		},
		float = {
			preview_split = "right",
		},
		keymaps = {
			["<ESC>"] = { "actions.close", mode = "n" },
			["<C-v>"] = { "actions.select", opts = { vertical = true } },
		},
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
