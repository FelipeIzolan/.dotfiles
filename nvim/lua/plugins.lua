-- BOOTSTRAP | START
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
-- BOOTSTRAP | END

local plugins = {
	{ 'fedepujol/move.nvim' },
	{ 'nvim-tree/nvim-web-devicons', lazy = true },
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'rebelot/kanagawa.nvim', config = function() require("configs.kanagawa") end},
	{ 'neovim/nvim-lspconfig' },
	{ 'williamboman/mason.nvim',
		config = true,
		dependencies = { 'williamboman/mason-lspconfig.nvim', 'b0o/schemastore.nvim' }
	},
	{ 'hrsh7th/nvim-cmp',
		config = function() require("configs.cmp") end,
		dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'L3MON4D3/LuaSnip' }
	},
}

require("lazy").setup(plugins)
vim.cmd("colorscheme kanagawa")
require("configs.lsp")

-- My plugins :)
require("configs._autosave")
require("configs._comment")
require("configs._netrw")
require("configs._diagnostic")
