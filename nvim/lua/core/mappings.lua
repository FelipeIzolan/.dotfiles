local map = function(mode, key, command)
  vim.keymap.set(mode, key, command, { silent = true })
end

local map_callback = function(mode, key, callback)
  vim.api.nvim_set_keymap(mode, key, "", { callback = callback })
end

map("","<Leader>t",":Explore<CR>")
map("","<Leader>q",":q!<CR>")

map("v", "<C-W>", ":MoveBlock(-1)<CR>")
map("v", "<C-S>", ":MoveBlock(1)<CR>")

local is_hide = false;
map_callback("", "<Leader>d", function()
  if is_hide then vim.diagnostic.show()
  else vim.diagnostic.hide() end
  is_hide = not is_hide
end)
