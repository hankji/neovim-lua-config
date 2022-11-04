local opt = vim.opt
local g = vim.g

opt.cursorcolumn = true
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
-- vim.cmd [[colorscheme gruvbox-material]]
vim.cmd("silent! command! NvCloseAllBuf lua require('nvchad_ui/tabufline').closeAllBufs('')")

g.mapleader = ","
-- need soft link from ~/config/nvim/snippets to snippets
g.luasnippets_path = "./snippets"

-- for fold
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
