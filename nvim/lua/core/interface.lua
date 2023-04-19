vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.number = true

vim.o.cursorline = true
vim.o.cursorlineopt = "number"

vim.api.nvim_set_hl(0, "CurrentWord", { bold=true, underline=true })
vim.api.nvim_set_hl(0, "CurrentWordTwins", { bold=true })
