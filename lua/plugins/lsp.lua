return {
    -- LSP configuration and installation using mason and mason-lspconfig
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { "williamboman/mason.nvim" },
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = { "pylsp", "tsserver", "clangd", "lua_ls", "bashls" },
          automatic_installation = true,
        })
      end,
    },
    {
      "neovim/nvim-lspconfig",
      event = { "BufRead", "BufNewFile" },
      config = function()
        -- You can move your lspconfig related settings here
        require("config.lsp")
      end,
    },
  }
  