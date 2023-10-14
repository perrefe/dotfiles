local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  defaults = { lazy = true },
  ui = {
    border = "rounded",
  },
  checker = { enabled = true },
  debug = false
}

require("lazy").setup("plugins", opts)

local plugins = {
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cpm and treesitter
  "numToStr/Comment.nvim", -- Easily comment stuff
  { "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" },
  'moll/vim-bbye',
  'nvim-lualine/lualine.nvim',
--  use 'akinsho/toggleterm.nvim'
  { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" },
  { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" },

  -- Colorschemes
  "LunarVim/onedarker",
  --use "LunarVim/darkplus"
  "rktjmp/lush.nvim",
  --use "metalelf0/jellybeans-nvim"

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",

  --- Motion
  "folke/flash.nvim", -- Navigate code

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim", --for formatters and linters
  "RRethy/vim-illuminate",

  -- Telescope
  "nvim-telescope/telescope.nvim",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2"
  },
  {
    "TimUntersberger/neogit",
    dependencies = { {"sindrets/diffview.nvim"} }
  }
}

