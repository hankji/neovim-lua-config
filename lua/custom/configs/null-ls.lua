local present, null_ls = pcall(require, "null-ls")

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
  b.formatting.shfmt.with { extra_args = { "-i", "4" } },
  b.formatting.fixjson,
  b.formatting.black.with { extra_args = { "--fast" } },
  b.formatting.isort,
  b.formatting.stylua,
  -- b.formatting.gofumpt,
  b.formatting.gofumpt.with { extra_args = { "-w", "$FILENAME" } },
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

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
  debug = false,
  debounce = 150,
  save_after_format = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- if vim.g.vim_version < 8 then
          -- if vim.version().minor < 8 then
          --   vim.lsp.buf.formatting_sync()
          -- else
          --   vim.lsp.buf.format { bufnr = bufnr }
          -- end
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}
