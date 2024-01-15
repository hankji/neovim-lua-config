local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lsp-config"
    end, -- Override to setup mason-lspconfig
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  -- Install a plugin
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    init = require("core.utils").lazy_load "nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "custom.configs.treesitter-context"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    init = require("core.utils").lazy_load "nvim-treesitter-textobjects",
    -- after = "nvim-treesitter/nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "custom.configs.treesitter-textobjects"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = require("custom.configs.gitsigns").gitsigns,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    init = require("core.utils").lazy_load "pretty-fold.nvim",
    config = function()
      require("pretty-fold").setup {
        remove_fold_markers = false,
      }
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    init = require("core.utils").lazy_load "refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "Exafunction/codeium.vim",
    init = require("core.utils").lazy_load "codeium.vim",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  {
    "folke/which-key.nvim",
    enabled = true,
  },

  -- 暂时关闭,https://todo.sr.ht/~whynothugo/lsp_lines.nvim/44
  -- {
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   init = require("core.utils").lazy_load "lsp_lines.nvim",
  --   config = function()
  --     require("lsp_lines").setup()
  --   end,
  -- },
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup {}
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },
  -- {
  --   "ggandor/leap.nvim",
  --   init = require("core.utils").lazy_load "leap.nvim",
  --   config = function()
  --     require("leap").add_default_mappings()
  --     vim.keymap.del({ "x", "o" }, "x")
  --     vim.keymap.del({ "x", "o" }, "X")
  --     vim.keymap.set("n", "s", function()
  --       local current_window = vim.fn.win_getid()
  --       require("leap").leap { target_windows = { current_window } }
  --     end)
  --   end,
  -- },
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    config = function()
      require("dropbar").setup()
    end,
    -- optional, but required for fuzzy finder support
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = require("custom.configs.flash_opt").option,
    keys = require("custom.configs.flash_opt").keys,
  },
  {
    "echasnovski/mini.align",
    version = "*",
    config = function()
      require("mini.align").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.custom-dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require "custom.configs.custom-dapui"
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("trouble").setup()
    end,
  },
  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup()
    end,
  },
}

return plugins
