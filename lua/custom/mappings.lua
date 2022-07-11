local M = {}

M.telescope = {
   n = {
      ["<leader>re"] = { "<cmd> Telescope resume <CR>", "   resume show" },
      ["<leader>fs"] = { "<cmd> Telescope grep_string <CR>", "   grep_string" },
  },
}

return M
