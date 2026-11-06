require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gopls" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "biome", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		docker = { "dockerfile-language-server" },
		yaml = { "yamlfmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
