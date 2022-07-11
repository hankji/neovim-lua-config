-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "gruvbox",
}

M.plugins = {
   override = {
	 ["nvim-treesitter/nvim-treesitter"] = {
        ensure_installed = { "c", "lua", "rust", "go", "python" },
     },
   },
   remove = {},
   user = require("custom.plugins"),
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig", -- path of lspconfig file
      },
   },
}

M.options = {
   -- load your options here or load module with options
   user = function() 
	   require("custom.options")
   end,
}

M.mappings = require "custom.mappings"

return M
