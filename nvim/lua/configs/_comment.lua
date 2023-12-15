local compt = {
	["// %s"] = { "c", "cpp", "javascript", "typescript", "javascriptreact", "typescriptreact", "go", "rust", "json", "jsonc" },
	["# %s"] = { "make", "python", "ruby", "conf" },
	["-- %s"] = { "lua", "sql" },
	["<!-- %s -->"] = { "html", "svelte" },
	["/* %s */"] = { "css" },
}

local function comment(template, line)
	return template:format(line)
end

local function uncomment(template, line)
	local fpos = template:find("%s")
	local _end = template:sub(fpos + 3)

	line = line:sub(fpos + 1)
	line = _end ~= "" and line:sub(0, line:find(_end) - 3) or line

	return line
end

local function template()
	local t

	for key, l in pairs(compt) do
		for _, v in ipairs(l) do
			if v == vim.bo.filetype then
				t = key
				break
			end
		end

		if t then break end
	end

	return t
end

local function range()
	local s = vim.fn.line("v")
	local e = vim.fn.line(".")

	if s > e then
		e = s
		s = vim.fn.line(".")
	end

	return s - 1, e
end

vim.api.nvim_set_keymap("", "<Leader>c", "", {
	callback = function ()
		local t = template()

		if t then
			local mode = vim.api.nvim_get_mode().mode

			-- NORMAL MODE
			if mode == "n" then
				local line = vim.api.nvim_get_current_line()
				line = line:sub(0, 2) == t:sub(0,2) and uncomment(t, line) or comment(t, line)
				vim.api.nvim_set_current_line(line)
			end

			-- VISUAL MODE
			if mode == "v" then
				local _start, _end = range()
				local lines = vim.api.nvim_buf_get_lines(0, _start, _end, true)

				for i, line in ipairs(lines) do
					lines[i] = line:sub(0, 2) == t:sub(0,2) and uncomment(t, line) or comment(t, line)
				end

				vim.api.nvim_buf_set_lines(0, _start, _end, true, lines)
			end
		end
	end
})
