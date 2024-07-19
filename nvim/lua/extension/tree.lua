local devicons = require("nvim-web-devicons")

vim.g.netrw_hide = 0
vim.g.netrw_banner = 0
vim.g.netrw_sizestyle = 'H'
vim.g.netrw_sort_by = "exten"

local namespace = vim.api.nvim_create_namespace("netrw")
vim.api.nvim_create_autocmd('BufModifiedSet', {
  pattern = { '*' },
  callback = function()
		if vim.bo.filetype ~= "netrw" then return end

    vim.keymap.set('n', 'z', '%', {remap = true, buffer = true}) -- create file
    vim.keymap.set('n', 'x', 'd', {remap = true, buffer = true}) -- create directory
		vim.keymap.set('n', 'c', 'R', {remap = true, buffer = true}) -- rename
    vim.keymap.set('n', 'v', 'D', {remap = true, buffer = true}) -- delete

		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

		for i, line in ipairs(lines) do
			local opts = { id = i }

			if line == "./" or line == "../" or line:find("^.*()/") then
				opts.sign_text = " "
			else
				local icon, color = devicons.get_icon(line, nil, { default = true })

				if icon then
					opts.sign_text = icon
					opts.sign_hl_group = color
				end
			end

			vim.api.nvim_buf_set_extmark(0, namespace, i - 1, 0, opts)
		end
	end
})
