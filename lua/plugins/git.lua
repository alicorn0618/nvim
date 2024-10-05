return {
    {
      "tpope/vim-fugitive",
      event = "User InGitRepo",
      config = function()
        require("config.fugitive")
      end,
    },
    {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("config.gitsigns")
      end,
    },
  }
  