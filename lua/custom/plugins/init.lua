return {
   ["jose-elias-alvarez/null-ls.nvim"] = {
     after = "nvim-lspconfig",
   },
   ["dstein64/vim-startuptime"] = { cmd = "StartupTime" },
   -- ["morhetz/gruvbox"] = {},
   ["sainnhe/gruvbox-material"] = {},
   ["goolord/alpha-nvim"] = {
     disable = false,
   },
   ['lewis6991/gitsigns.nvim'] = {
     config = function()
       require('custom.plugins.gitsigns').setup()
     end
   },
   ['airblade/vim-gitgutter'] = {},
   ['tpope/vim-fugitive'] = {},
}
