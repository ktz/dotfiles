require("snacks").setup({
	indent = { enabled = true },
	input = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	picker = {
		enabled = true,
	},
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	Snacks.picker.files({ hidden = true })
end, { desc = "Find files" })
vim.keymap.set({ "n", "v" }, "<leader>F", function()
	Snacks.picker.files({ hidden = true, ignored = true })
end, { desc = "Find files" })
vim.keymap.set({ "n", "v" }, "<leader>g", function()
	Snacks.picker.grep({ hidden = true })
end, { desc = "Grep" })
vim.keymap.set({ "n", "v" }, "<leader>G", function()
	Snacks.picker.grep({ hidden = true, ignored = true })
end, { desc = "Grep" })
vim.keymap.set({ "n", "v" }, "<leader>b", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
