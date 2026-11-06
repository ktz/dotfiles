require("oil").setup({
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
})

vim.keymap.set("n", "<leader>d", function()
	require("oil").open_float(".")
end, { desc = "Oil ." })
