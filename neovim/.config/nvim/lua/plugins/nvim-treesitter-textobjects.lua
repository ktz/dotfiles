vim.g.no_plugin_maps = true
require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = true,
		selection_modes = {
			["@parameter.outer"] = "v",
			["@function.outer"] = "V",
		},
		include_surrounding_whitespace = false,
	},
	move = {
		set_jumps = true,
	},
})
local ttselect = require("nvim-treesitter-textobjects.select")
vim.keymap.set({ "x", "o" }, "am", function()
	ttselect.select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "im", function()
	ttselect.select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
	ttselect.select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
	ttselect.select_textobject("@class.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "as", function()
	ttselect.select_textobject("@local.scope", "locals")
end)

local ttswap = require("nvim-treesitter-textobjects.swap")
vim.keymap.set("n", "<leader>a", function()
	ttswap.swap_next("@parameter.inner")
end)
vim.keymap.set("n", "<leader>A", function()
	ttswap.swap_previous("@parameter.outer")
end)

local ttmove = require("nvim-treesitter-textobjects.move")
vim.keymap.set({ "n", "x", "o" }, "]m", function()
	ttmove.goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]]", function()
	ttmove.goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]o", function()
	ttmove.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]s", function()
	ttmove.goto_next_start("@local.scope", "locals")
end)
vim.keymap.set({ "n", "x", "o" }, "]z", function()
	ttmove.goto_next_start("@fold", "folds")
end)

vim.keymap.set({ "n", "x", "o" }, "]M", function()
	ttmove.goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "][", function()
	ttmove.goto_next_end("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[m", function()
	ttmove.goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[[", function()
	ttmove.goto_previous_start("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[M", function()
	ttmove.goto_previous_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[]", function()
	ttmove.goto_previous_end("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]d", function()
	ttmove.goto_next("@conditional.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[d", function()
	ttmove.goto_previous("@conditional.outer", "textobjects")
end)
