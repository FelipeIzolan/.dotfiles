local lsp = require("lspconfig")
local mason_lsp = require("mason-lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local handlers = {
  function (lsp_server)
	  if lsp_server == "jsonls" then
			return lsp.jsonls.setup ({
		    settings = {
			    json = {
				    schemas = require('schemastore').json.schemas(),
				    validate = { enable = true },
			    },
		    },
		    capabilities = capabilities
	    })
	  end

		if lsp_server == "yamlls" then
			return lsp.yamlls.setup({
  			settings = {
    			yaml = {
      			schemaStore = { enable = false, url = "" },
      			schemas = require('schemastore').yaml.schemas(),
    			},
  			},
		    capabilities = capabilities
			})
		end

	  lsp[lsp_server].setup({ capabilities = capabilities })
  end
}

mason_lsp.setup_handlers(handlers)
