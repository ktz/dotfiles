return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		-- Only one of these is needed.
		-- "sindrets/diffview.nvim",        -- optional
		"esmuellert/codediff.nvim", -- optional

		-- For a custom log pager
		-- "m00qek/baleia.nvim",            -- optional

		"folke/snacks.nvim",
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>ng", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
	},
}
