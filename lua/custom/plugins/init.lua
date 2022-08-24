return {
    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        config = function()
            require("custom.plugins.null-ls")
        end,
    },
    ["dstein64/vim-startuptime"] = { cmd = "StartupTime" },
    -- ["morhetz/gruvbox"] = {},
    ["sainnhe/gruvbox-material"] = {},
    ["goolord/alpha-nvim"] = {
        disable = false,
    },
    ["lewis6991/gitsigns.nvim"] = {
        config = function()
            require("custom.plugins.gitsigns").setup()
        end,
    },
    ["ray-x/go.nvim"] = {
        config = function()
            require("go").setup()
        end,
    },
    ["ray-x/guihua.lua"] = {},
    -- ["folke/which-key.nvim"] = { disable = false },
}
