vim.g.mapleader = ","

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.relativenumber = true
vim.o.colorcolumn = "80"

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = false
vim.o.number = true

vim.o.cursorline = true
vim.o.cursorlineopt = "number"

vim.wo.signcolumn = "yes"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	import = "plugins",
	install = {
		colorscheme = "tokyonight-night",
	},
})

vim.cmd([[colorscheme tokyonight-night]])
