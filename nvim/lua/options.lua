vim.g.mapleader = " "

local opts = {
	backup = false,
	tabstop = 2,
	shiftwidth = 0,
	expandtab = true,
	mouse = "a",
	clipboard = "unnamedplus",
	number = true,
	numberwidth = 1,
	timeoutlen = 1000,
	termguicolors = true,
	laststatus = 2
}

for key,value in pairs(opts) do
  vim.opt[key] = value
end

-- My custom filetypes :)
vim.filetype.add({
	extension = {
-- 		svelte = "svelte",
		conf = "conf"
	}
})
