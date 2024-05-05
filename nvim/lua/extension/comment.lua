local function comment(template, line)
  return line == "" and line or template:format(line)
end

local function uncomment(template, line)
  template = template:gsub("[%-+]", "%%-")
                     :gsub("[%*+]", "%%*")
                     ---------------------
                     :gsub("%%s", "(.+)")

  line = line:match(template)
	return line
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
		local t = vim.bo.commentstring
    local mode = vim.api.nvim_get_mode().mode

    if t == "" then return end

    -- NORMAL MODE
    if mode == "n" then
      local line = vim.api.nvim_get_current_line()
      line = uncomment(t, line) or comment(t, line)
      vim.api.nvim_set_current_line(line)
    end

    -- VISUAL MODE
    if mode == "v" then
      local _start, _end = range()
      local lines = vim.api.nvim_buf_get_lines(0, _start, _end, true)

      for i, line in ipairs(lines) do
        lines[i] = uncomment(t, line) or comment(t, line)
      end

      vim.api.nvim_buf_set_lines(0, _start, _end, true, lines)
		end
	end
})
