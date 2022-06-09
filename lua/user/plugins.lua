local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({
		"L3MON4D3/LuaSnip",
		"casonadams/walh",
		"folke/trouble.nvim",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/nvim-cmp",
		"jose-elias-alvarez/null-ls.nvim",
		"neovim/nvim-lspconfig",
		"nvim-lua/lsp-status.nvim",
		"saadparwaiz1/cmp_luasnip",
	})
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff, Normal: gcc, gbc, Visual: gc, bc
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("folke/which-key.nvim")
	use({ "tpope/vim-surround" })
	use({ "weirongxu/plantuml-previewer.vim", requires = { "tyru/open-browser.vim", "aklt/plantuml-syntax" } })
	use({
		"ethanholz/nvim-lastplace",
		event = "BufRead",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
				lastplace_open_folds = true,
			})
		end,
	})

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use("lunarvim/darkplus.nvim")
  use("dunstontc/vim-vscode-theme")
  use ("sainnhe/sonokai")
  use ("tomasiser/vim-code-dark")
  use "cpea2506/one_monokai.nvim"
  use 'olimorris/onedarkpro.nvim'

	-- cmp plugins
	use("dcampos/nvim-snippy")
	use({
		"David-Kunz/cmp-npm",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = "require('user.lsp.cmp-npm')",
	})
	use({
		"petertriho/cmp-git",
		config = "require('user.lsp.cmp-git')",
	})
	-- snippets
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	-- use {'p00f/nvim-ts-rainbow', after = {'nvim-treesitter'}}
	use({ "mattn/emmet-vim" })
	use({ "lukas-reineke/indent-blankline.nvim", config = "require('user.indent')" })
	use({ "norcalli/nvim-colorizer.lua", config = "require('user.colorizer')" })
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("alvan/vim-closetag")
	use("jiangmiao/auto-pairs")

	-- LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	-- use {'hrsh7th/cmp-calc', after = 'cmp-cmdline'}
	-- use {'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
	-- use {'David-Kunz/cmp-npm', after = 'cmp-tabnine', requires = 'nvim-lua/plenary.nvim', config = "require('user.lsp.cmp-npm')"}
	-- use {'jose-elias-alvarez/nvim-lsp-ts-utils', after = {'nvim-treesitter'}, config = "require('user.lsp-ts-utils')"}
	-- use {'SmiteshP/nvim-gps', config = "require('user.gps')", after = 'nvim-treesitter'}
	use({ "onsails/lspkind-nvim" })

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("unblevable/quick-scope")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Debugger
	use({ "mfussenegger/nvim-dap", config = "require('user.dap')" })
	use({ "rcarriga/nvim-dap-ui", config = "require('user.dapui')" })

	use("OmniSharp/omnisharp-vim")
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
