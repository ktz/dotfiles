require("nvim-treesitter").setup({
	install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "/treesitter"),
})
local langs = {
	"awk",
	"bash",
	"c",
	"cmake",
	"comment",
	"cpp",
	"css",
	"dockerfile",
	"go",
	"html",
	"ini",
	"javascript",
	"jq",
	"json",
	"kdl",
	"nix",
	"proto",
	"rust",
	"slint",
	"sql",
	"ssh_config",
	"svelte",
	"toml",
	"tsx",
	"typescript",
	"yaml",
	"zsh",
}
require("nvim-treesitter").install(langs)
local enabled_parsers = {}
local parser_aliases = {
	sh = "bash",
	sshconfig = "ssh_config",
	typescriptreact = "tsx",
}
for _, lang in ipairs(langs) do
	enabled_parsers[lang] = true
end

vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
	pattern = "*",
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		local lang = parser_aliases[ft] or vim.treesitter.language.get_lang(ft)
		if not enabled_parsers[lang] then
			return
		end
		-- Parser installation is asynchronous; retry on the next buffer entry.
		if not pcall(vim.treesitter.start, args.buf, lang) then
			return
		end
		vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
