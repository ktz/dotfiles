-- 1. Create a function to initialize the plugin configuration and keymaps
local function setup_flash()
	-- Load the plugin package safely
	-- pcall(vim.cmd, "packadd flash.nvim")

	-- Configure flash.nvim
	require("flash").setup({
		modes = {
			search = {
				enabled = true, -- Note: Fixed typo from 'enables' to 'enabled'
			},
			char = {
				jump_labels = true,
			},
		},
	})

	-- Set up keymaps
	vim.keymap.set({ "n", "x", "o" }, "s", function()
		require("flash").jump()
	end, { desc = "Flash" })

	vim.keymap.set({ "n", "x", "o" }, "S", function()
		require("flash").treesitter()
	end, { desc = "Flash Treesitter" })

	vim.keymap.set("o", "r", function()
		require("flash").remote()
	end, { desc = "Remote Flash" })

	vim.keymap.set({ "o", "x" }, "R", function()
		require("flash").treesitter_search()
	end, { desc = "Treesitter Search" })

	vim.keymap.set({ "c" }, "<c-s>", function()
		require("flash").toggle()
	end, { desc = "Toggle Flash Search" })
end

-- 2. Trigger the setup function via an autocommand to achieve "VeryLazy" behavior
-- vim.api.nvim_create_autocmd("User", {
-- 	pattern = "VeryLazy",
-- 	callback = function()
-- 		setup_flash()
-- 	end,
-- })
setup_flash()
