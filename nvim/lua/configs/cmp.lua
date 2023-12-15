local cmp = require("cmp")

local default = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
}

local configs = {
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = string.format(" %s", default[vim_item.kind])
      return vim_item
    end
  },
  snippet = {
  	expand = function(args)
    	require('luasnip').lsp_expand(args.body)
    end
  },
	window = {
		completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
	},
	sources = {
    { name = "nvim_lsp" },
		{ name = 'luasnip' },
    { name = "path" },
    { name = "buffer" }
  },
  mapping = {
    ["<C-UP>"] = cmp.mapping.select_prev_item(),
    ["<C-DOWN>"] = cmp.mapping.select_next_item(),
		["<CR>"] = cmp.mapping.confirm(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item()
      else fallback() end
    end, {
      "i",
      "s",
    })
  }
}

cmp.setup(configs)
