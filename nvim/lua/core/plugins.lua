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
  { 'FelipeIzolan/lipoide.nvim' },
  { 'stevearc/conform.nvim', config = true },
  { 'nvimdev/indentmini.nvim', config = require("config.indentmini")},
  { 'fedepujol/move.nvim', config = true },
  { 'nvim-tree/nvim-web-devicons', lazy = true, config = require("config.nvim-web-devicons") },
  { 'nvim-treesitter/nvim-treesitter', config = function() require("config.nvim-treesitter") end },
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim',
    config = true,
    dependencies = { 'williamboman/mason-lspconfig.nvim', 'b0o/schemastore.nvim' }
  },
  { 'hrsh7th/nvim-cmp',
    config = function() require("config.nvim-cmp") end,
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'L3MON4D3/LuaSnip' }
  },
  {
    "iamcco/markdown-preview.nvim",
    config = function() require("config.markdown-preview") end,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}

require("lazy").setup(plugins)
vim.cmd("colorscheme lipoide")

require("config.nvim-lspconfig")
