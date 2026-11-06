-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
-- Fallback safely to OSC 52 for writing without trigger-happy reads
-- vim.g.clipboard = {
-- 	name = "OSC 52",
-- 	copy = {
-- 		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
-- 		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
-- 	},
-- 	paste = {
-- 		-- Leave this empty or use standard registers to avoid automated background read loops
-- 		["+"] = function()
-- 			return vim.fn.getreg('"')
-- 		end,
-- 		["*"] = function()
-- 			return vim.fn.getreg('"')
-- 		end,
-- 	},
-- }

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
vim.opt.mouse = ""
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", eol = "↲", extends = "»", precedes = "«" }
vim.opt.scrolloff = 5
vim.opt.cmdheight = 0
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.autoread = true
vim.filetype.add({
	extension = {
		templ = "templ",
	},
})
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80,120"
