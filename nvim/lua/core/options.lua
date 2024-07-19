vim.g.mapleader = " "

local opts = {
	backup = false,
	tabstop = 2,
	expandtab = true,
	copyindent = true,
	preserveindent = true,
	shiftwidth = 0,
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
		conf = "conf"
	}
})
