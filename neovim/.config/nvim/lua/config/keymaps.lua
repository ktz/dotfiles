vim.api.nvim_set_keymap("n", "<leader>c", "gcc", { noremap = false, silent = true })
vim.api.nvim_set_keymap("v", "<leader>c", "gc", { noremap = false, silent = true })
vim.keymap.set("n", "Q", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "q", ":noh<cr>", { noremap = true, silent = true })

-- vim.keymap.set("n", "<leader>d", "<cmd>Oil --float<CR>")
vim.keymap.set("n", "<leader>d", function()
	require("oil").open_float(".")
end, { desc = "Oil ." })
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Fload" })

--vim.keymap.set("n", "<leader>cf", function()
--	require("conform").format()
--end, { desc = "Format current file" })

--vim.keymap.set('n', 'Q', '<nop>', { noremap = true, silent = true })
--vim.keymap.set('n', 'q', ':noh<cr>', { noremap = true, silent = true })
