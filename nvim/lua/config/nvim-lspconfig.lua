local lsp = require("lspconfig")
local lsp_util = require("lspconfig/util")
local mason_lsp = require("mason-lspconfig")

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function (client, _) client.server_capabilities.semanticTokensProvider = nil end

local custom = {
  ['jsonls'] = {
		settings = {
			json = {
				schemas = require('schemastore').json.schemas(),
			  validate = { enable = true },
		  },
		},
		capabilities = capabilities,
	  on_attach = on_attach
  },

  ['yamlls'] = {
	  settings = {
    	yaml = {
      	schemaStore = { enable = false, url = "" },
      	schemas = require('schemastore').yaml.schemas(),
      },
  	},
		capabilities = capabilities,
		on_attach = on_attach
  },

  ['rust_analyzer'] = {
    root_dir = lsp_util.root_pattern("Cargo.toml"),
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
        }
      }
    },
		capabilities = capabilities,
		on_attach = on_attach
  }
}

local handlers = {
  function (lsp_server)
    if custom[lsp_server] then
      return lsp[lsp_server].setup(custom[lsp_server])
    end

	  lsp[lsp_server].setup({ capabilities = capabilities, on_attach = on_attach, diagnostics = { enable = true } })
  end
}

mason_lsp.setup_handlers(handlers)
