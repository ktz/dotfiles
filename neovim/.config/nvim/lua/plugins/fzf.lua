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
			"<leader>F",
			function()
				require("fzf-lua").files({ no_ignore = true })
			end,
			desc = "Find all files in current working directory",
		},
		{
			"<leader>g",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Grep current working directory",
		},
		{
			"<leader>G",
			function()
				require("fzf-lua").live_grep({ no_ignore = true })
			end,
			desc = "Grep all current working directory",
		},
		{
			"<leader>b",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Find buffers in current working directory",
		},
	},
}
