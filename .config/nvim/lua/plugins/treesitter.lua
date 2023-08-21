local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-lua/plenary.nvim",
  },
  opts = {
    ensure_installed = { "lua", "bash", "c", "cmake", "diff", "dockerfile", "go", "hcl", "vimdoc", "html", "http", "java", "javascript", "json", "make", "python", "regex", "ruby", "sql", "toml", "vue", "yaml" },
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    autopairs = {
      enable = true,
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    }
  },
  config = function(_,opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}

return M
