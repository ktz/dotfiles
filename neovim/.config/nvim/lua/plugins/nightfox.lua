return { "EdenEast/nightfox.nvim",
	config = function()
		require('nightfox').setup({
			options = {
				transparent = true,
				overrides=function(colors)
					return {
						["@markup.link.url.markdown_inline"] = { link = "Special" },
						["@markup.link.label.markdown_inline"] = { link = "WarningMsg" },
						["@markup.italic.markdown_inline"] = { link = "Execption" },
						["@markup.raw.markdown_inline"] = { link = "String" },
						["@markup.list.markdown"] = { link = "Function" },
						["@markup.quote.markdown"] = { link = "Error" },
						["@markup.list.checked.markdown"] = { link = "WarningMsg" }
					}
				end
			}
		});
		vim.cmd("colorscheme nightfox");
	end,
	build = function()
--		vim.cmd("NightfoxCompile");
		require('nightfox').compile();
	end,
}
