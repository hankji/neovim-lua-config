-- example file i.e lua/custom/init.lua

-- load your globals, autocmds here or anything .__.

_G.utils_g = {}

utils_g.log = function(msg, hl, name)
   name = name or "Neovim"
   hl = hl or "Todo"
   vim.api.nvim_echo({ { name .. ": ", hl }, { msg } }, true, {})
end

utils_g.warn = function(msg, name)
   vim.notify(msg, vim.log.levels.WARN, { title = name })
end

utils_g.error = function(msg, name)
   vim.notify(msg, vim.log.levels.ERROR, { title = name })
end

utils_g.info = function(msg, name)
   vim.notify(msg, vim.log.levels.INFO, { title = name })
end
