local function setup_which_key()
	require("which-key").setup({})
end

setup_which_key()

vim.keymap.set({ "n", "v" }, "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Buffer Local keymaps (which-key)" })
