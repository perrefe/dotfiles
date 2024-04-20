return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function(_, _)
      -- local utils = require("utils")
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
      local lsp_utils = require("plugins.lsp.lsp-utils")
      lsp_utils.setup()

      local servers = {
        "lua_ls",
        "ansiblels",
        "bashls",
        "dockerls",
        --"jdtls",
        --"ruby_ls",
        "sqlls",
        "html",
        "tsserver",
        "eslint",
        --"pyright",
        "jsonls",
        "yamlls",
      }

      mason_lspconfig.setup({
        ensure_installed = servers,
        automatic_installation = { exclude = { "gopls" } }
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          local defaults = {
            on_attach = lsp_utils.on_attach,
            capabilities = lsp_utils.capabilities,
          }
          local has_custom_settings, custom_settings = pcall(require, "plugins.lsp.settings." .. server_name)
          if has_custom_settings then
            defaults = vim.tbl_deep_extend("force", defaults, custom_settings)
          end
          lspconfig[server_name].setup(defaults)
        end
      })

      -- gopls
      lspconfig.gopls.setup({
        on_attach = lsp_utils.on_attach,
        capabilities = lsp_utils.capabilities,
        cmd = { "gopls" },
        filetypes = { "go" }
      })
    end
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 2,
    },
    config = function(_,opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local packages = {
        "bash-language-server",
        "eslint-lsp",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "markdownlint",
        "prettier",
        "shfmt",
        "typescript-language-server",
        "yaml-language-server",
      }
      local function ensure_installed()
        for _, package in ipairs(packages) do
          local p = mr.get_package(package)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  }
}
