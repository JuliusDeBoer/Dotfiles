require("plugins/plugins")

require("catppuccin").setup({
    flavour = "mocha",
    integrations = {
        cmp = true,
        telescope = true,
        notify = true,
		noice = true,
		markdown = true,
		treesitter = true,
		which_key = true
    }
})

compile_path = vim.fn.stdpath "cache" .. "/catppuccin"

vim.cmd.colorscheme "catppuccin"
