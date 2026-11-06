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

_G.Snacks = require("snacks")

vim.keymap.set({ "n" }, "<leader>f", function()
	require("snacks").picker.files({ hidden = true })
end, { desc = "Find files" })
vim.keymap.set({ "n" }, "<leader>F", function()
	Snacks.picker.files({ hidden = true, ignored = true })
end, { desc = "Find files" })
vim.keymap.set({ "n" }, "<leader>g", function()
	Snacks.picker.grep({ hidden = true })
end, { desc = "Grep" })
vim.keymap.set({ "n" }, "<leader>G", function()
	Snacks.picker.grep({ hidden = true, ignored = true })
end, { desc = "Grep" })
vim.keymap.set({ "n" }, "<leader>b", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })

-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = "*",
-- 	desc = "Delete invisible buffers",
-- 	callback = function()
-- 		Snacks.bufdelete.invisible()
-- 	end,
-- })
