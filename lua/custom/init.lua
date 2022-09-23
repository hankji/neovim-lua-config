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
