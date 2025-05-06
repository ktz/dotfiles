vim.api.nvim_set_keymap("n", "<leader>c", "gcc", { noremap = false, silent = true })
vim.api.nvim_set_keymap("v", "<leader>c", "gc", { noremap = false, silent = true })
vim.keymap.set("n", "Q", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "q", ":noh<cr>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader>p", [["+p]], { noremap = true, silent = true })

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
vim.api.nvim_create_user_command("T", function(opts)
	vim.cmd("split")
	vim.cmd("wincmd j")
	vim.cmd("resize 20")
	vim.cmd("terminal " .. table.concat(opts.fargs, " "))
end, { nargs = "*" })

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	command = "startinsert",
})

vim.api.nvim_set_keymap("t", "<ESC>", [[<C-\><C-n>]], { noremap = true, silent = true })
