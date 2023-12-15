local is_hide = false;

vim.api.nvim_set_keymap("", "<Leader>d", "", {
  callback = function ()
    if is_hide then vim.diagnostic.show()
    else vim.diagnostic.hide() end
    is_hide = not is_hide
  end
})
