local M = {}

M.setup_lsp = function(attach, capabilities)
	local lspconfig = require("lspconfig")

	-- lspservers with default config
	local servers = { "gopls", "clangd", "sumneko_lua" }

	for _, lsp in ipairs(servers) do
		local opt = {
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
		if lsp == "gopls" then
			opt["cmd"] = { "gopls", "--remote=auto" }
		end
		if lsp == "clangd" then
			opt["cmd"] = { "clangd" }
		end
		if lsp == "sumneko_lua" then
			opt["settings"] = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
				},
			}
		end
		lspconfig[lsp].setup(opt)
	end
end

return M
