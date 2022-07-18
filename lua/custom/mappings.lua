local M = {}

M.telescope = {
    n = {
        ["<leader>re"] = { "<cmd> Telescope resume <CR>", "   resume show" },
        ["<leader>fs"] = { "<cmd> Telescope grep_string <CR>", "   grep_string" },
        ["<F2>"] = { "<cmd> Telescope lsp_document_symbols <CR>", "   list document symbols" },
    },
}

return M
