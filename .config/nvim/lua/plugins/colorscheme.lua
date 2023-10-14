local M = {
  "drewtempelmeyer/palenight.vim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme palenight ]])
  end,
}

return M
