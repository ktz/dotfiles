vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight yank",
})

vim.api.nvim_set_hl(0, "ZenkakuSpace", {
	ctermbg = "red",
	bg = "#ff0000",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*",
	callback = function()
		vim.fn.matchadd("ZenkakuSpace", "　")
	end,
	desc = "Highlight Zenkaku spaces",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "Dockerfile.*",
	callback = function()
		vim.bo.filetype = "dockerfile"
	end,
	desc = "Set filetype for custom Dockerfiles",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = ".env*",
	callback = function()
		vim.bo.filetype = "sh"
	end,
	desc = "Set filetype for environment files",
})
