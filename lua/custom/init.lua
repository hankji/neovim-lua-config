local opt = vim.opt
local g = vim.g

opt.cursorcolumn = true
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.scrolloff = 5
vim.cmd "silent! command! NvCloseAllBuf lua require('nvchad_ui/tabufline').closeAllBufs('')"

g.mapleader = ","
-- need soft link from ~/config/nvim/snippets to snippets
-- g.luasnippets_path = "./snippets"

-- for folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
-- opt.foldcolumn = 2
-- opt.foldcolumn = auto
-- opt.fillchars = "foldopen:-,foldclose:>"
-- 设置折叠区域的宽度
-- 如果不为0，则在屏幕左侧显示一个折叠标识列
-- 分别用“-”和“+”来标识打开和关闭的折叠 see: h fillchars
