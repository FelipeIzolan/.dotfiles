local lsp = require("lspconfig")
local mason_lsp = require("mason-lspconfig")

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function (client, _) client.server_capabilities.semanticTokensProvider = nil end

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
		    capabilities = capabilities,
		    on_attach = on_attach
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
		    capabilities = capabilities,
		    on_attach = on_attach
			})
		end

	  lsp[lsp_server].setup({ capabilities = capabilities, on_attach = on_attach })
  end
}

mason_lsp.setup_handlers(handlers)
