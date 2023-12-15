vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	callback = function()
		if vim.bo.filetype ~= "netrw" and vim.bo.filetype ~= "lazy" and vim.bo.filetype ~= "mason" and vim.bo.filetype ~= "" then
			vim.cmd(":w!")
		end
	end
})
