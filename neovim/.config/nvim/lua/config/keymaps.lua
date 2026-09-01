vim.api.nvim_set_keymap("n", "<leader>c", "gcc", { noremap = false, silent = true })
vim.api.nvim_set_keymap("v", "<leader>c", "gc", { noremap = false, silent = true })
vim.keymap.set("n", "Q", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "q", ":noh<cr>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader>p", [["+p]], { noremap = true, silent = true })

vim.keymap.set("n", "<leader>d", function()
	require("oil").open_float(".")
end, { desc = "Oil ." })
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Fload" })

vim.api.nvim_set_keymap("t", "<ESC>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- avoid tmux keymap
-- Increment/Decrement with + and -
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

-- Visual mode (retains selection after change)
vim.keymap.set("v", "+", "<C-a>gv", { desc = "Increment number" })
vim.keymap.set("v", "-", "<C-x>gv", { desc = "Decrement number" })
