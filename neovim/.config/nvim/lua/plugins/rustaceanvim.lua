vim.g.rustaceanvim = {
	server = {
		default_settings = {
			["rust-analyzer"] = {
				cargo = {
					buildScripts = {
						enable = true,
					},
				},
				diagnostics = {
					disabled = { "macro-error", "inactive-code" },
				},
				files = {
					excludeDirs = { "target" },
				},
			},
		},
	},
}
