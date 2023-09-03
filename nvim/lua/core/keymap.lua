vim.g.mapleader = ","

vim.api.nvim_set_keymap("n", "<leader>nf", ":enew<cr>", { noremap=true, silent=true })

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
	{silent = true, noremap = true}
)
