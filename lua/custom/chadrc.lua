-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
    theme = "gruvbox",
}

M.plugins = require("custom.plugins")

M.options = {}

M.mappings = require("custom.mappings")

return M