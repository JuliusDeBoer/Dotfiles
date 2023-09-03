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
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"nvim-tree/nvim-web-devicons"
	},
	{
		"catppuccin/nvim",
		name="catppuccin"
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies={
			"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
			'hrsh7th/cmp-nvim-lua', 'saadparwaiz1/cmp_luasnip',
			'saadparwaiz1/cmp_luasnip', 'octaltree/cmp-look',
			'hrsh7th/cmp-path', 'hrsh7th/cmp-calc', 'f3fora/cmp-spell',
			'hrsh7th/cmp-emoji'
		},
		lazy=false
	},
	{
		"haorenW1025/completion-nvim"
	},
	{
		"nvim-treesitter/nvim-treesitter"
	},
	{
		"altermo/ultimate-autopair.nvim",
		event={'InsertEnter','CmdlineEnter'},
		branch='v0.6',
		opts={ }
	},
	{
		"lalitmee/browse.nvim", dependencies="nvim-telescope/telescope.nvim"
	},
	{
		"numToStr/Comment.nvim",
		config=function()
			require('Comment').setup()
		end
	},
	{
		"neovim/nvim-lspconfig"
	},
	{
		"xiyaowong/virtcolumn.nvim"
	},
	-- {
	-- 	"windwp/nvim-ts-autotag"
	-- },
	{
		"ggandor/lightspeed.nvim"
	},
	{
		"lambdalisue/fern.vim"
	},
	{
		"lukas-reineke/indent-blankline.nvim"
	},
	{
		"nvim-lua/plenary.nvim"
	},
	{
		"mfussenegger/nvim-jdtls"
	},
	{
		"mklabs/mdn.vim"
	},
	{
		"nvim-treesitter/completion-treesitter"
	},
	{
		"dominikduda/vim_current_word"
	},
	{
		"folke/trouble.nvim"
	},
	{
		"tpope/vim-surround"
	},
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter"
		}
	},
	{
		"ThePrimeagen/harpoon",
		dependencies={
			"nvim-lua/plenary.nvim"
		}
	},
	{
		"SmiteshP/nvim-navic",
		dependencies={
			"neovim/nvim-lspconfig"
		}
	},
	{
		"L3MON4D3/LuaSnip",
		version = "1.*"
	},
	{
		"folke/noice.nvim",
		dependencies={
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify"
		}
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	},
	{
		"TimUntersberger/neogit",
		dependencies = {
			{'nvim-lua/plenary.nvim'}
		}
	},
	{
		"itchyny/lightline.vim",
		config=function ()
			vim.g.lightline = {
				colorscheme = 'catppuccin'
			}
		end
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim"},
		config = function ()
			require("gitsigns").setup()
		end
	},
	{
		"tpope/vim-fugitive"
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		-- event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end
	},
	{
		"stevearc/overseer.nvim",
		commit = "3047ede61cc1308069ad1184c0d447ebee92d749", -- Recommended to to avoid breaking changes
		cmd = {"CompilerOpen", "CompilerToggleResults"},
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
				bindings = {
					["q"] = function() vim.cmd("OverseerClose") end ,
				}
			}
		}
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { }
	},
	{
		"nvim-treesitter/nvim-treesitter-context"
	}
});
