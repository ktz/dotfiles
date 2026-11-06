return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	-- enabled = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	init = function()
		vim.g.no_plugin_maps = true
	end,
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,
				-- You can choose the select mode (default is charwise 'v')
				--
				-- Can also be a function which gets passed a table with the keys
				-- * query_string: eg '@function.inner'
				-- * method: eg 'v' or 'o'
				-- and should return the mode ('v', 'V', or '<c-v>') or a table
				-- mapping query_strings to modes.
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					-- ['@class.outer'] = '<c-v>', -- blockwise
				},
				-- If you set this to `true` (default is `false`) then any textobject is
				-- extended to include preceding or succeeding whitespace. Succeeding
				-- whitespace has priority in order to act similarly to eg the built-in
				-- `ap`.
				--
				-- Can also be a function which gets passed a table with the keys
				-- * query_string: eg '@function.inner'
				-- * selection_mode: eg 'v'
				-- and should return true of false
				include_surrounding_whitespace = false,
			},
			move = {
				set_jumps = true,
			},
		})

		-- keymaps
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

		-- keymaps
		-- You can use the capture groups defined in `textobjects.scm`
		local ttmove = require("nvim-treesitter-textobjects.move")
		vim.keymap.set({ "n", "x", "o" }, "]m", function()
			ttmove.goto_next_start("@function.outer", "textobjects")
		end)
		vim.keymap.set({ "n", "x", "o" }, "]]", function()
			ttmove.goto_next_start("@class.outer", "textobjects")
		end)
		-- You can also pass a list to group multiple queries.
		vim.keymap.set({ "n", "x", "o" }, "]o", function()
			ttmove.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
		end)
		-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
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

		-- Go to either the start or the end, whichever is closer.
		-- Use if you want more granular movements
		vim.keymap.set({ "n", "x", "o" }, "]d", function()
			ttmove.goto_next("@conditional.outer", "textobjects")
		end)
		vim.keymap.set({ "n", "x", "o" }, "[d", function()
			ttmove.goto_previous("@conditional.outer", "textobjects")
		end)
	end,
}
