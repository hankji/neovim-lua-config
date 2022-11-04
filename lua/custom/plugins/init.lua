return {
    ["nvim-treesitter/nvim-treesitter"] = {
        override_options = {
            ensure_installed = { "c", "lua", "rust", "go", "python" },
        },
    },
    ["nvim-treesitter/nvim-treesitter-context"] = {
        -- after = "nvim-treesitter/nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("custom.plugins.treesitter-context")
        end,
    },
    ["williamboman/mason.nvim"] = {
        override_options = {
            ensure_installed = {
                -- lua stuff
                "lua-language-server",
                "stylua",

                -- go dev
                "gopls",
                "gofumpt",

                -- shell
                "shfmt",
                "shellcheck",
            },
        },
    },
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
    ["folke/which-key.nvim"] = { disable = false },
    ["ThePrimeagen/refactoring.nvim"] = {
        require = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" },
        },
    },
    -- support for up and down arrow keys in cmp
    ["hrsh7th/nvim-cmp"] = {
        override_options = function()
            local cmp = require("cmp")

            return {
                mapping = {
                    ["<Up>"] = cmp.mapping.select_prev_item(),
                    ["<Down>"] = cmp.mapping.select_next_item(),
                },
            }
        end,
    },
    ["anuvyklack/pretty-fold.nvim"] = {
        config = function()
            require("pretty-fold").setup({
                remove_fold_markers = false,
            })
        end,
    },
    ["ggandor/leap.nvim"] = {
        config = function()
            require("leap").add_default_mappings()
        end,
    },
}
