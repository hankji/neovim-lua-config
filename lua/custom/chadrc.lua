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
     ["williamboman/mason.nvim"] = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- go dev
        "gopls",
        "gofumpt",

        -- shell
        "shfmt",
        "shellcheck",
        },
     },
     -- ["neovim/nvim-lspconfig"] = {
     --    config = function()
     --       require "plugins.configs.lspconfig"
     --       require "custom.plugins.lspconfig"
     --    end,
     -- },
 },
   remove = {},
   user = require("custom.plugins"),
   options = {},
}

M.options = {
   -- load your options here or load module with options
}

M.mappings = require "custom.mappings"

return M
