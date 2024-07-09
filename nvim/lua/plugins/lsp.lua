return {
	{
		"williamboman/mason.nvim",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "Mason" },
		dependencies = {
			-- LSP
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",

			-- DAP
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",

			-- Lint
			"mfussenegger/nvim-lint",

			-- Formatter
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				inlay_hints = { enabled = true },
			})

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						root_dir = require("lspconfig.util").root_pattern(".git"),
					})
				end,
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",

			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("snippy").expand_snippet(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "snippy" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
					}),
				},
			})

			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" },
				}, {
					{ name = "buffer" },
				}),
			})

			vim.cmd([[
			sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
			sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
			sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
			sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
			]])

			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
				},
				signs = true,
				underline = true,
				update_in_insert = true,
				severity_sort = true,
			})

			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		opts = {
			lightbulb = {
				enable = false,
			},
			symbol_in_winbar = {
				enable = false,
			},
		},
		keys = {
			{
				"<leader>rn",
				"<cmd>Lspsaga rename<cr>",
				desc = "Rename symbol",
			},
			{
				"<leader>ca",
				"<cmd>Lspsaga code_action<cr>",
				desc = "Code action",
			},
		},
		cmd = {
			"Lspsaga",
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
