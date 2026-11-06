return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		indent = { enabled = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		picker = {
			enabled = true,
		},
	},
	keys = {
		{
			"<leader>f",
			function()
				Snacks.picker.files({ hidden = true })
			end,
			desc = "Find Files",
		},
		{
			"<leader>F",
			function()
				Snacks.picker.files({ hidden = true, ignored = true })
			end,
			desc = "Find Files",
		},
		{
			"<leader>g",
			function()
				Snacks.picker.grep({ hidden = true })
			end,
			desc = "Grep",
		},
		{
			"<leader>G",
			function()
				Snacks.picker.grep({ hidden = true, ignored = true })
			end,
			desc = "Grep",
		},
		{
			"<leader>b",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
	},
}
