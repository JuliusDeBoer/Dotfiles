return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 1000
		end,
		opts = {},
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		event = "InsertEnter",
		opts = {},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Open Trouble.nvim" },
		},
		opts = {},
	},
	{
		"dominikduda/vim_current_word",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			vim.api.nvim_set_hl(0, "CurrentWord", { bold = true, underline = true })
			vim.api.nvim_set_hl(0, "CurrentWordTwins", { bold = true })
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"sindrets/diffview.nvim",
		},
		opts = {
			kind = "replace",
		},
		cmd = {
			"Neogit",
		},
		keys = {
			{ "<leader>ng", "<cmd>Neogit<cr>", desc = "Open Neogit" },
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>nc", "<cmd>Neotree current<cr>", desc = "Open NeoTree in current buffer" },
			{ "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree to the side" },
		},
		opts = {
			close_if_last_window = true,
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false,
				},
			},
			window = {
				hijack_netrw_behavior = "open_current",
			},
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			user_default_options = {
				names = false,
				tailwind = true,
				mode = "virtualtext",
			},
		},
	},
	{
		"leath-dub/stat.nvim",
		config = function()
			require("stat").setup({
				statusline = {
					Stat.mod.file(),
					Stat.___,
					{ raw = true, value = " %l:%c " },
					Stat.mod.mode,
				},
				theme = {
					["N"] = { fg = "#1e1e2e", bg = "#a6e3a1" },
					["I"] = { fg = "#1e1e2e", bg = "#fab387" },
					["V"] = { fg = "#1e1e2e", bg = "#cba6f7" },
					["C"] = { fg = "#1e1e2e", bg = "#89b4fa" },
					["T"] = { fg = "#1e1e2e", bg = "#f38ba8" },
					["S"] = { fg = "#1e1e2e", bg = "#a6e3a1" },
					["File"] = { fg = "#a6e3a1", bg = "#1e1e2e" },
					["FileType"] = { fg = "#a6e3a1", bg = "#1e1e2e" },
				},
			})
		end,
	},
}
