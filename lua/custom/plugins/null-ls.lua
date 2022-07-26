local present, null_ls = pcall(require, "null-ls")
local on_attach = require("plugins.configs.lspconfig").on_attach

if not present then
   return
end

local with_diagnostics_code = function(builtin)
   return builtin.with {
      diagnostics_format = "[#{c}] #{m} (#{s})",
   }
end

local b = null_ls.builtins

local sources = {
   -- formatting
   b.formatting.prettierd,
   b.formatting.shfmt,
   b.formatting.fixjson,
   b.formatting.black.with { extra_args = { "--fast" } },
   b.formatting.isort,
   b.formatting.stylua,
   b.formatting.gofumpt,
   b.formatting.goimports,

   -- diagnostics
   with_diagnostics_code(b.diagnostics.write_good),
   with_diagnostics_code(b.diagnostics.eslint_d),
   with_diagnostics_code(b.diagnostics.flake8),
   with_diagnostics_code(b.diagnostics.tsc),
   with_diagnostics_code(b.diagnostics.selene),
   with_diagnostics_code(b.diagnostics.golangci_lint),
   with_diagnostics_code(b.diagnostics.shellcheck),

   -- code actions
   b.code_actions.gitsigns,
   b.code_actions.eslint_d,
   b.code_actions.gitrebase,
   b.code_actions.refactoring,

   -- hover
   b.hover.dictionary,
}

null_ls.setup {
   debug = true,
   debounce = 150,
   save_after_format = false,
   sources = sources,
   on_attach = on_attach,
}
