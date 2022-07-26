local M = {}

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

	-- lspservers with default config
local lspconfig = require "lspconfig"
local servers = { "gopls", "clangd" }
 
for _, lsp in ipairs(servers) do
  local opt = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  if lsp == "gopls" then
    opt["cmd"] = { "gopls", "--remote=auto" }
  elseif lsp == "clangd" then
	opt["cmd"] = { "clangd" }
  end
  lspconfig[lsp].setup {opt}
end

