local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "pyright" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["gpls"] = {
      ["gofumpt"] = true,
      ["usePlaceholders"] = true,
      ["codelenses"] = {
        ["generate"] = true,
        ["gc_details"] = true,
      },
      semanticTokens = true,
    },
  },
}

--
-- lspconfig.pyright.setup { blabla}

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config {
  virtual_text = false,
  virtual_lines = true,
}
