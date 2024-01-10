local devicons = require("nvim-web-devicons")

local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

function StatusLine()
	local _t = vim.fn.expand("%t")
	local icon, color = devicons.get_icon(_t, nil, { default = true })

	local err = " " .. #vim.diagnostic.get(0, { severity = "Error" })
  local warn = " " .. #vim.diagnostic.get(0, { severity = "Warn" })
  local hint = " 󰛨" .. #vim.diagnostic.get(0, { severity = "Hint" })
  
  return
    "%#Comment# " .. modes[vim.api.nvim_get_mode().mode] .. " " ..
	  " %l,%c " ..
	  "%#" .. color .. "# " .. icon .. vim.bo.filetype .. " " ..
	  "%#DiagnosticVirtualTextError#% " .. err .. 
	  "%#DiagnosticVirtualTextWarn#% " .. warn .. 
	  "%#DiagnosticVirtualTextHint#% " .. hint .. " " ..
    "%#Comment#  %F"
end

vim.api.nvim_exec([[
  augroup StatusLine
  au!
  au WinEnter,BufEnter,BufModifiedSet * setlocal statusline=%!v:lua.StatusLine()
  augroup END
]], false)
