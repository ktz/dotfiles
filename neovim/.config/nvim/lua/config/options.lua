-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"

vim.opt.expandtab = true
vim.opt.shiftwidth = 2

vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

-- vim.opt.undofile = true
-- vim.opt.undodir=~/.vimundo
-- need gitignore .*.un~

vim.opt.mouse = ""

vim.opt.showmode = false

vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250

-- vim.opt.splitright = true
-- vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", eol = "↲", extends = "»", precedes = "«" }

vim.opt.scrolloff = 5
vim.opt.cmdheight = 0

vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight yank",
})

vim.cmd([[
	hi ZenkakuSpace ctermbg=red guibg=#ff0000
	au BufNewFile,BufRead * match ZenkakuSpace /　/
	autocmd BufNewFile,BufRead Dockerfile.* set filetype=dockerfile
  autocmd BufNewFile,BufRead .env* set filetype=sh
]])

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})
