return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
			{ "<leader>lg", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>" },
			{ "<leader>ws", "<cmd>Telescope lsp_workspace_symbols<cr>" },
			{ "<leader>rf", "<cmd>Telescope lsp_references<cr>" },
		},
	},
}
