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
	{ 'FelipeIzolan/lipoide.nvim' },
	{ 'nvim-tree/nvim-web-devicons', lazy = true },
	{ 'nvim-treesitter/nvim-treesitter', config = function () require("configs.treesitter") end },
	{ 'neovim/nvim-lspconfig' },
	{ 'williamboman/mason.nvim',
		config = true,
		dependencies = { 'williamboman/mason-lspconfig.nvim', 'b0o/schemastore.nvim' }
	},
	{ 'hrsh7th/nvim-cmp',
		config = function() require("configs.cmp") end,
		dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'L3MON4D3/LuaSnip' }
	},
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_page_title = "${name}"
      vim.g.mkdp_combine_preview = 1
    end,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}

require("lazy").setup(plugins)
vim.cmd("colorscheme lipoide")
require("configs.lsp")

-- My plugins :)
require("scripts.tree")
require("scripts.comment")
require("scripts.autosave")
require("scripts.diagnostic")
