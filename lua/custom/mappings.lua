local M = {}

M.general = {
  i = {
    ["jj"] = { "<ESC>", "escape", opts = { nowait = true } },
    ["jk"] = { "<ESC>", "escape", opts = { nowait = true } },
  },
}
M.telescope = {
  n = {
    ["<leader>re"] = { "<cmd> Telescope resume <CR>", "   resume show" },
    ["<leader>fs"] = { "<cmd> Telescope grep_string <CR>", "   grep_string" },
    ["<F2>"] = { "<cmd> Telescope lsp_document_symbols <CR>", "   list document symbols" },
  },
}
M.dapui = {
  n = {
    ["<leader>kk"] = { "<cmd> lua require('dapui').eval() <CR>", "show variable value in dapui" },
  },
}
M.lspconfig = {
  n = {
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format()
      end,
      "   lsp formatting",
    },
    ["<leader>of"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
  },
}

return M
