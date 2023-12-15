local map = function(mode, key, command)
  vim.keymap.set(mode, key, command, { silent = true })
end

map("","<Leader>t",":Explore<CR>")
map("","<Leader>q",":q!<CR>")

map("v", "<C-W>", ":MoveBlock(-1)<CR>")
map("v", "<C-S>", ":MoveBlock(1)<CR>")
