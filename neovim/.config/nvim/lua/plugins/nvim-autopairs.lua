vim.api.nvim_create_autocmd("InsertEnter", {
	desc = "Lazy load nvim-autopairs",
	once = true,
	callback = function()
		vim.cmd("packadd nvim-autopairs")
		require("nvim-autopairs").setup({})
	end,
})
