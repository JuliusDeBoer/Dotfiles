return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				integrations = {
					alpha = true,
					cmp = true,
					telescope = true,
					gitsigns = true,
					noice = true,
					notify = true,
					treesitter = true,
					which_key = true,
					dashboard = true,
					mason = true,
				},
			})
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}
