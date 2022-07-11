local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { "gopls", "clangd" }

   for _, lsp in ipairs(servers) do
	   local cmd = {}
       if lsp == "gopls" then
	     cmd = { 'gopls', '--remote=auto' }
       end
	   if lsp == "clangd" then
	     cmd = { 'clangd' }
	   end
      lspconfig[lsp].setup {
		 cmd = cmd,
		 on_attach = function(client, bufnr)
			 attach(client, bufnr)
             local default_ops = {
                on_attach = attach,
             }
            -- Configure formatting
            require("custom.plugins.null-ls.formatters").setup(client, bufnr)
			 require("custom.plugins.null-ls").setup(default_ops)
		 end,
         capabilities = capabilities,
      }
   end
end

return M
