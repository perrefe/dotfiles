require "config.options"
require "config.lazy"

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function ()
    require "config.keymaps"
    require "config.functions"
  end
})

require "user.gitsigns"
require "user.autopairs"
require "user.comment"
require "user.bufferline"
require "user.lualine"
require "user.project"
require "user.alpha"
require "user.diffview"
require "user.flash"
