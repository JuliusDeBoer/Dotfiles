vim.g.mapleader = ","

vim.api.nvim_set_keymap("n", "<leader>nf", ":enew<cr>", { noremap=true, silent=true })

vim.api.nvim_set_keymap("n", "o", "o<esc>", { noremap=true, silent=true })
vim.api.nvim_set_keymap("n", "O", "O<esc>", { noremap=true, silent=true })
