return {
    {
      "nvim-lualine/lualine.nvim",
      event = "VeryLazy",
      config = function()
        require("config.lualine")
      end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      event = "VeryLazy",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("config.nvim-tree")
      end,
    },
  }
  