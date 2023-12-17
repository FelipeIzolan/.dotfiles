vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	callback = function()
    if not vim.bo.readonly and vim.bo.modifiable then
      vim.cmd(":w")
    end
  end
})
