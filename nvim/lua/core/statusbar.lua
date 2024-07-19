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

local mode = function ()
  return "%#Comment#%  " .. modes[vim.api.nvim_get_mode().mode] .. " "
end

local cursor = function ()
  return "%l,%c "
end

local filetype = function ()
  local icon, color = devicons.get_icon(vim.bo.filetype, nil, { default = true })
  return "%#" .. color .. "#% " .. icon .. vim.bo.filetype .. " "
end

local diagnostic = function ()
  local err = " " .. #vim.diagnostic.get(0, { severity = "Error" })
  local warn = " " .. #vim.diagnostic.get(0, { severity = "Warn" })
  local hint = " 󰛨" .. #vim.diagnostic.get(0, { severity = "Hint" })

  return "%#DiagnosticVirtualTextError#% " .. err ..
	       "%#DiagnosticVirtualTextWarn#% " .. warn ..
	       "%#DiagnosticVirtualTextHint#% " .. hint .. " "
end

function StatusLine()
  return
    mode() ..
    cursor() ..
    filetype() ..
    diagnostic() ..
	  "%#Comment#  %F"
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufModifiedSet", "WinEnter" }, {
  callback = function ()
    if vim.bo.buftype ~= "terminal" then 
      vim.cmd("set statusline=%!v:lua.StatusLine()")
    else
      vim.cmd("set statusline=%#Comment#")
    end
  end
})
