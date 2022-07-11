local M = {}

local nls_utils = require "custom.plugins.null-ls.utils"
local nls_sources = require "null-ls.sources"

local method = require("null-ls").methods.FORMATTING

M.autoformat = true

function M.toggle()
   M.autoformat = not M.autoformat
   if M.autoformat then
      utils_g.info("Enabled format on save", "Formatting")
   else
      utils_g.warn("Disabled format on save", "Formatting")
   end
end

function M.format()
   if M.autoformat then
      vim.lsp.buf.formatting {
         async = true,
         -- NOTE: some lsp don't support this syntax
         -- filter = function(clients)
         --   return vim.tbl_filter(function(client)
         --     return client.name ~= "tsserver"
         --   end, clients)
         -- end,
      }
   end
end

function M.setup(client, buf)
   local filetype = vim.api.nvim_buf_get_option(buf, "filetype")

   local enable = false
   if M.has_formatter(filetype) then
      enable = client.name == "null-ls"
   else
      enable = not (client.name == "null-ls")
   end

   -- FIXME: this could make some non null-ls lsp which don't has format cap enabled auto-format by accident
   client.server_capabilities.documentFormattingProvider = enable
   client.server_capabilities.documentRangeFormattingProvider = enable
   if client.server_capabilities.documentFormattingProvider then
      vim.cmd [[
      augroup LspFormat
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua require("custom.plugins.null-ls.formatters").format()
      augroup END
    ]]
   end
end

function M.has_formatter(filetype)
   local available = nls_sources.get_available(filetype, method)
   return #available > 0
end

function M.list_registered(filetype)
   local registered_providers = nls_utils.list_registered_providers_names(filetype)
   return registered_providers[method] or {}
end

function M.list_supported(filetype)
   local supported_formatters = nls_sources.get_supported(filetype, "formatting")
   table.sort(supported_formatters)
   return supported_formatters
end

return M
