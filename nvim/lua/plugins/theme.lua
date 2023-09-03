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
		which_key = true,
		dashboard = true,
		mason = true
  },

	compile_path = vim.fn.stdpath "cache" .. "/catppuccin"
})

require("lspsaga").setup {
	ui = {
		kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
	}
}


vim.cmd.colorscheme "catppuccin"
