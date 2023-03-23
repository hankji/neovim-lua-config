---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "one_light" },
  transparency = true,
  nvdash = { load_on_startup = true },
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    lsprogress_len = 15,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
