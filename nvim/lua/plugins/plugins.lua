local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
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
	"nvim-tree/nvim-web-devicons",
	{
		"catppuccin/nvim",
		name="catppuccin"
	},
	{
		"goolord/alpha-nvim", dependencies={ "nvim-tree/nvim-web-devicons" },
    	config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
    	end
	},
	{
		"nvim-telescope/telescope.nvim", 
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies={
			"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
			'hrsh7th/cmp-nvim-lua',
			'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
			'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
		},
		lazy=false
	},
	"haorenW1025/completion-nvim",
	"nvim-treesitter/nvim-treesitter",
	{"nvim-lualine/lualine.nvim", dependencies={"nvim-tree/nvim-web-devicons"}},
	{ "windwp/nvim-autopairs", config=function() require("nvim-autopairs").setup {} end },
	{"lalitmee/browse.nvim", dependencies="nvim-telescope/telescope.nvim"},
	{ "numToStr/Comment.nvim", config =function() require('Comment').setup() end },
	"neovim/nvim-lspconfig",
	"xiyaowong/virtcolumn.nvim",
	"windwp/nvim-ts-autotag",
	"lukas-reineke/indent-blankline.nvim",
	"nvim-lua/plenary.nvim",
	"mfussenegger/nvim-jdtls",
	"mklabs/mdn.vim",
	"nvim-treesitter/completion-treesitter",
	"dominikduda/vim_current_word",
	"folke/trouble.nvim",
	{
		"SmiteshP/nvim-navic",
		dependencies = { { "neovim/nvim-lspconfig" } },
	},
	{
		"L3MON4D3/LuaSnip",
		version = "1.*",
	},
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify"
		}
	}
})
