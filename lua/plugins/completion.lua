return {
  -- Auto-completion engine
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-omni",
      "quangnguyen30192/cmp-nvim-ultisnips",
    },
    config = function()
      require("config.nvim-cmp")
    end,
  },

  -- Snippet engine and snippet templates
  { "SirVer/ultisnips", dependencies = { "honza/vim-snippets" }, event = "InsertEnter" },

  -- Handy Unix commands inside Vim
  { "tpope/vim-eunuch", cmd = { "Rename", "Delete" } },
}
