local M = {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local completion = null_ls.builtins.completion
    null_ls.setup({
      sources = {
        formatting.stylua,
        formatting.prettier,
        formatting.shfmt,
        diagnostics.eslint_d,
        diagnostics.trail_space
        --code_actions.gitsigns,
      }
    })
  end
}

return M
