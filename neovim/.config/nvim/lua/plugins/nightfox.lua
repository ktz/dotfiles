require("nightfox").setup({
	options = {
		transparent = true,
	},
	groups = {
		all = {
			["@markup.link.url.markdown_inline"] = { link = "Special" },
			["@markup.link.label.markdown_inline"] = { link = "WarningMsg" },
			["@markup.italic.markdown_inline"] = { link = "Exception" },
			["@markup.raw.markdown_inline"] = { link = "String" },
			["@markup.list.markdown"] = { link = "Function" },
			["@markup.quote.markdown"] = { link = "Error" },
			["@markup.list.checked.markdown"] = { link = "WarningMsg" },
		},
	},
})
vim.cmd("colorscheme nightfox")

vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("NightfoxCompile", { clear = true }),
	callback = function(event)
		if event.data.spec.name == "nightfox.nvim" and event.data.kind == "update" then
			require("nightfox").compile()
		end
	end,
})
