return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{
			"<leader>f",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find files in current working directory",
		},
		{
			"<leader>g",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Grep current working directory",
		},
	},
}
