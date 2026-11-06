require("blink.compat").setup({})
require("blink.cmp").setup({
	keymap = { preset = "enter" },

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = { documentation = { auto_show = true } },
	signature = { enabled = true },

	sources = {
		default = { "lsp", "path", "snippets", "buffer", "sql" },
		providers = {
			sql = {
				name = "sql",
				module = "blink.compat.source",
				score_offset = -3,
				opts = {},
				should_show_items = function()
					return vim.tbl_contains({ "sql" }, vim.o.filetype)
				end,
			},
		},
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },
})
