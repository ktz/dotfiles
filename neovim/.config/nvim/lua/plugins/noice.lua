-- ~/.config/nvim/lua/plugins/noice.lua

-- 1. Create a function to handle dependencies, plugin loading, and initialization
local function setup_noice()
	-- Load dependencies first, then the main plugin
	-- pcall(vim.cmd, "packadd nui.nvim")
	-- pcall(vim.cmd, "packadd noice.nvim")

	-- Initialize Noice configuration
	require("noice").setup({
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false, -- Note: Fixed typo from 'inc_renmae' to 'inc_rename'
			lsp_doc_border = false,
		},
	})
end

setup_noice()
-- -- 2. Bind the function to your VeryLazy execution block
-- vim.api.nvim_create_autocmd("User", {
-- 	pattern = "VeryLazy",
-- 	callback = function()
-- 		setup_noice()
-- 	end,
-- })
--
