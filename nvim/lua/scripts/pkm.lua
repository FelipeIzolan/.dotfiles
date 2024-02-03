local function choose(item)
  vim.api.nvim_win_call(MiniPick.get_picker_state().windows.target, function() vim.cmd('e ~/Documents/.pkm/content/' .. item) end)
  MiniPick.stop()
end

local function pkm()
  if vim.bo.filetype ~= "markdown" then
    local interface = io.popen("find ~/Documents/.pkm/content/ -type f -printf \"%P\n\"", "r")
    local data = interface:read("a")
    interface:close()

    local iterator = data:gmatch("(.-)\n")
    local items = {}

    for line in iterator do
      table.insert(items, line)
    end

    MiniPick.start({ source = { items = items, choose = choose } })    
  else
    vim.cmd("MarkdownPreview")
  end
end

vim.api.nvim_create_user_command("PKM", pkm, {})
